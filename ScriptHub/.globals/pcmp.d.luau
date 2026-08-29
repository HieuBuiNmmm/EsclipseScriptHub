-- This gives you type definitons for ProCMP build info.
-- See https://github.com/Proton-Utilities/ProCMP for more info.

declare __COMPOSER: {
    Insert: (text: string) -> string,
    
    genDate: string,
    build: string,
    cfg: string,
    vers: string
}

declare _P: {[any]: any}