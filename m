Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8201A7916
	for <lists.virtualization@lfdr.de>; Tue, 14 Apr 2020 13:06:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5554D2033B;
	Tue, 14 Apr 2020 11:06:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pOjIienQdn2L; Tue, 14 Apr 2020 11:06:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BE763203EA;
	Tue, 14 Apr 2020 11:06:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B5A5C0172;
	Tue, 14 Apr 2020 11:06:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18D99C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 11:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F2CF784A33
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 11:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQu0Po4NbYEp
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 11:06:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0B567848BE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 11:06:32 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id w2so10059005edx.4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 04:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jk5vPZolZWjbbWpF1lvVaQOVnXO2pCw5mbbhY1ViA3E=;
 b=FIEcqCnt2Cj8jo/yJIz+K6Ab0gl6pPuhDceKDBQX9fYZ0uYh3J55VG9R8f5WfFfOg2
 3CZU80KDhN80AB4/FqxWdJ2KlXQwujOEVsPxXGAbdVSN/lTRdaPnA0bhPNeJwVsJrEUX
 +5y2pkNSDAlVToQUspK+uZuQJWhtBlSO76uSiWRvM0tX3+gTTFEL1FKmz3h2l57qMdL3
 9WYXCCyPRZCVmEwnzmdLEEzHyP7uG25oHWds48n1Mv6tRTqfL6r4dwNm/loacDM4kgmD
 3iTONdGzNquLHiQAFBwZBM0TwRXdyKLkuoembNwfp4NwwSdG3MA/innkoDNSblRv6psQ
 fAmg==
X-Gm-Message-State: AGi0Pubgf6HqpewDYtlP7b2MXOHV773zXlWrBUMqzDCmYRRjPLDBlde2
 MFCkXfMFg0JRWwrWQIjO/sk=
X-Google-Smtp-Source: APiQypLrIGkp9DUlmHy5tHISHkCUu3xjihhqKqc4JucNd4uNhEf8QhklqY7QowNChXzTgbgx31Hw5w==
X-Received: by 2002:a50:ce58:: with SMTP id k24mr19769370edj.218.1586862390273; 
 Tue, 14 Apr 2020 04:06:30 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id g15sm2052311ejk.77.2020.04.14.04.06.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Apr 2020 04:06:29 -0700 (PDT)
Date: Tue, 14 Apr 2020 13:06:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Build regressions/improvements in v5.7-rc1
Message-ID: <20200414110627.GA1373@kozik-lap>
References: <20200413093100.24470-1-geert@linux-m68k.org>
 <alpine.DEB.2.21.2004131232220.32713@ramsan.of.borg>
 <877dyijrh7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877dyijrh7.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux-foundation.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Apr 14, 2020 at 08:23:32PM +1000, Michael Ellerman wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > On Mon, 13 Apr 2020, Geert Uytterhoeven wrote:
> >> Below is the list of build error/warning regressions/improvements in
> >> v5.7-rc1[1] compared to v5.6[2].
> >>
> >> Summarized:
> >>  - build errors: +132/-3
> >>  - build warnings: +257/-79
> >>
> >> Happy fixing! ;-)
> >>
> >> Thanks to the linux-next team for providing the build service.
> >>
> >> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/8f3d9f354286745c751374f5f1fcafee6b3f3136/ (all 239 configs)
> >> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/7111951b8d4973bda27ff663f2cf18b663d15b48/ (all 239 configs)
> >>
> >>
> >> *** ERRORS ***
> >>
> >> 132 error regressions:
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/hash.h: error: implicit declaration of function 'pte_raw' [-Werror=implicit-function-declaration]:  => 192:2
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/hash.h: error: implicit declaration of function 'pte_raw'; did you mean 'pte_read'? [-Werror=implicit-function-declaration]:  => 192:8
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/mmu-hash.h: error: 'SLICE_NUM_HIGH' undeclared here (not in a function):  => 698:2, 698:30
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/mmu-hash.h: error: 'struct mmu_psize_def' has no member named 'ap':  => 207:28
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/mmu-hash.h: error: 'struct mmu_psize_def' has no member named 'avpnm':  => 337:57
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/mmu-hash.h: error: 'struct mmu_psize_def' has no member named 'penc':  => 411:49
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/mmu-hash.h: error: 'struct mmu_psize_def' has no member named 'penc'; did you mean 'enc'?:  => 411:50
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/mmu-hash.h: error: 'struct mmu_psize_def' has no member named 'sllp':  => 218:32, 219:26
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/mmu-hash.h: error: redefinition of 'mmu_psize_to_shift':  => 195:28
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/mmu-hash.h: error: redefinition of 'shift_to_mmu_psize':  => 185:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable-4k.h: error: implicit declaration of function 'pgd_raw' [-Werror=implicit-function-declaration]:  => 35:3
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable-4k.h: error: implicit declaration of function 'pgd_raw'; did you mean 'pgd_val'? [-Werror=implicit-function-declaration]:  => 35:13
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable-4k.h: error: implicit declaration of function 'pud_raw' [-Werror=implicit-function-declaration]:  => 25:3
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable-4k.h: error: implicit declaration of function 'pud_raw'; did you mean 'pud_val'? [-Werror=implicit-function-declaration]:  => 25:13
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable-4k.h: error: redefinition of 'hugepd_ok':  => 44:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable-4k.h: error: redefinition of 'pgd_huge':  => 29:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable-4k.h: error: redefinition of 'pmd_huge':  => 9:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable-4k.h: error: redefinition of 'pud_huge':  => 19:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: expected ')' before '!=' token:  => 964:19, 921:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: expected ')' before '==' token:  => 979:19, 801:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: expected ')' before '^' token:  => 801:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: expected ')' before '__vmalloc_end':  => 291:21, 274:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: expected identifier or '(' before '!' token:  => 916:19, 904:19, 939:19, 959:19, 868:19, 873:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: expected identifier or '(' before 'struct':  => 291:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: implicit declaration of function '__pgd_raw' [-Werror=implicit-function-declaration]:  => 976:2
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: implicit declaration of function '__pgd_raw'; did you mean '__fdget_raw'? [-Werror=implicit-function-declaration]:  => 976:9
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: implicit declaration of function '__pmd_raw' [-Werror=implicit-function-declaration]:  => 1075:9, 1075:2
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: implicit declaration of function '__pte_raw' [-Werror=implicit-function-declaration]:  => 552:2, 552:9
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: implicit declaration of function '__pud_raw' [-Werror=implicit-function-declaration]:  => 935:9, 935:2
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: incompatible types when returning type 'int' but 'pgd_t' was expected:  => 976:2
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: incompatible types when returning type 'int' but 'pgd_t' {aka 'struct <anonymous>'} was expected:  => 976:9
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: incompatible types when returning type 'int' but 'pmd_t' was expected:  => 1075:2
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: incompatible types when returning type 'int' but 'pmd_t' {aka 'struct <anonymous>'} was expected:  => 1075:9
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: incompatible types when returning type 'int' but 'pte_t' was expected:  => 675:2, 552:2, 971:2, 670:2, 1070:2, 647:2, 652:2, 642:2, 695:2, 660:2, 632:2, 665:2, 690:2, 627:2, 714:2, 930:2, 685:2, 637:2
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: incompatible types when returning type 'int' but 'pte_t' {aka 'struct <anonymous>'} was expected:  => 1070:9, 695:9, 627:9, 685:9, 642:9, 930:9, 647:9, 690:9, 665:9, 660:9, 675:9, 670:9, 714:9, 552:9, 971:9, 637:9, 632:9, 652:9
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: incompatible types when returning type 'int' but 'pud_t' was expected:  => 935:2
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: incompatible types when returning type 'int' but 'pud_t' {aka 'struct <anonymous>'} was expected:  => 935:9
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of '__ptep_set_access_flags':  => 789:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of '__ptep_test_and_clear_young':  => 371:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of '__set_pte_at':  => 815:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'huge_ptep_set_wrprotect':  => 437:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pfn_pte':  => 609:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pgd_clear':  => 954:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pgd_is_leaf':  => 1373:21, 1375:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pgd_pte':  => 969:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pmd_clear':  => 863:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pmd_is_leaf':  => 1359:21, 1361:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pmd_pte':  => 1068:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_access_permitted':  => 587:20, 586:30
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_ci':  => 853:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_clear':  => 474:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_devmap':  => 704:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_dirty':  => 480:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_exec':  => 495:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_exprotect':  => 630:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_hw_valid':  => 567:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_mkclean':  => 635:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_mkdirty':  => 663:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_mkexec':  => 645:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_mkhuge':  => 678:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_mkold':  => 640:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_mkprivileged':  => 688:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_mkpte':  => 650:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_mkspecial':  => 673:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_mkuser':  => 693:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_mkwrite':  => 655:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_mkyoung':  => 668:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_modify':  => 711:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_none':  => 808:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_pfn':  => 617:29
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_pgd':  => 974:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_present':  => 556:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_pud':  => 933:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_read':  => 421:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_special':  => 490:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_unmap':  => 1022:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_update':  => 353:29
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_user':  => 581:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_write':  => 416:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_wrprotect':  => 623:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pte_young':  => 485:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'ptep_get_and_clear':  => 451:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'ptep_get_and_clear_full':  => 459:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'ptep_set_wrprotect':  => 427:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pud_clear':  => 911:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pud_is_leaf':  => 1366:21, 1368:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: redefinition of 'pud_pte':  => 928:21
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: static declaration of 'map_kernel_page' follows non-static declaration:  => 1037:19
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: static declaration of 'vmemmap_create_mapping' follows non-static declaration:  => 1049:29
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/pgtable.h: error: static declaration of 'vmemmap_remove_mapping' follows non-static declaration:  => 1059:20
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/radix.h: error: implicit declaration of function 'pmd_raw' [-Werror=implicit-function-declaration]:  => 221:2
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/radix.h: error: implicit declaration of function 'pmd_raw'; did you mean 'pmd_val'? [-Werror=implicit-function-declaration]:  => 221:11
> >>  + /kisskb/src/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h: error: 'struct mmu_psize_def' has no member named 'ap':  => 11:30
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: 'struct kvm_vcpu_arch' has no member named 'book3s':  => 316:19
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: 'struct kvm_vcpu_arch' has no member named 'fault_dar':  => 396:19
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: 'struct kvm_vcpu_arch' has no member named 'fault_dar'; did you mean 'fault_dear'?:  => 396:20
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: redefinition of 'kvmppc_get_cr':  => 343:19
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: redefinition of 'kvmppc_get_ctr':  => 363:21
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: redefinition of 'kvmppc_get_fault_dar':  => 394:21
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: redefinition of 'kvmppc_get_gpr':  => 333:21
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: redefinition of 'kvmppc_get_lr':  => 373:21
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: redefinition of 'kvmppc_get_pc':  => 383:21
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: redefinition of 'kvmppc_get_xer':  => 353:21
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: redefinition of 'kvmppc_need_byteswap':  => 389:20
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: redefinition of 'kvmppc_set_cr':  => 338:20
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: redefinition of 'kvmppc_set_ctr':  => 358:20
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: redefinition of 'kvmppc_set_gpr':  => 328:20
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: redefinition of 'kvmppc_set_lr':  => 368:20
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: redefinition of 'kvmppc_set_pc':  => 378:20
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: redefinition of 'kvmppc_set_xer':  => 348:20
> >>  + /kisskb/src/arch/powerpc/include/asm/kvm_book3s.h: error: redefinition of 'kvmppc_supports_magic_page':  => 405:20
> >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable-4k.h: error: expected ')' before '!=' token:  => 58:40
> >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable-4k.h: error: expected ')' before '==' token:  => 57:37
> >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable-4k.h: error: expected identifier or '(' before '!' token:  => 56:25
> >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable.h: error: expected ')' before '!=' token:  => 163:40
> >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable.h: error: expected ')' before '==' token:  => 333:50
> >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable.h: error: expected ')' before '^' token:  => 333:36
> >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable.h: error: expected identifier or '(' before '!' token:  => 146:27, 144:24, 160:25, 161:24, 143:25
> >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable.h: error: expected identifier or '(' before 'struct':  => 77:21
> >>  + /kisskb/src/arch/powerpc/include/asm/nohash/pgtable.h: error: redefinition of 'pgd_huge':  => 291:19
> >>  + /kisskb/src/arch/powerpc/include/asm/nohash/pte-book3e.h: error: redefinition of 'pte_mkprivileged':  => 108:26
> >>  + /kisskb/src/arch/powerpc/include/asm/nohash/pte-book3e.h: error: redefinition of 'pte_mkuser':  => 115:20
> >>  + /kisskb/src/arch/powerpc/kvm/book3s_64_vio_hv.c: error: 'struct kvm_arch' has no member named 'spapr_tce_tables':  => 68:46, 68:2
> >
> > ppc64_book3e_allmodconfig
> 
> Caused by:
> 
> e93a1695d7fb ("iommu: Enable compile testing for some of drivers")
> 
> Which did:
> 
>  config SPAPR_TCE_IOMMU
>  	bool "sPAPR TCE IOMMU Support"
> -	depends on PPC_POWERNV || PPC_PSERIES
> +	depends on PPC_POWERNV || PPC_PSERIES || (PPC && COMPILE_TEST)
> 
> 
> Which is just ... not right, the dependencies on the correct platform
> are important, otherwise the build breaks.

The SPAPR_TCE_IOMMU should compile fine.  The actual trouble here is
that KVM_BOOK3S_64 selects SPAPR_TCE_IOMMU which is a user-visible
symbol.  This is generally discouraged because of exactly this error -
select ignores any dependencies.

I can revert the COMPILE_TEST for SPAPR_TCE_IOMMU or change
select->depends in KVM_BOOK3S_64.  I think the latter is the proper
change here.

Best regards,
Krzysztof

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
