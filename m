Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9353B1AF17F
	for <lists.virtualization@lfdr.de>; Sat, 18 Apr 2020 17:14:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2399B882A0;
	Sat, 18 Apr 2020 15:14:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XlPYo2UPdppo; Sat, 18 Apr 2020 15:14:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7A0EC88277;
	Sat, 18 Apr 2020 15:14:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58332C0172;
	Sat, 18 Apr 2020 15:14:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7495DC0172;
 Sat, 18 Apr 2020 15:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 62EA5876A0;
 Sat, 18 Apr 2020 15:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVFCbOgVAoiJ; Sat, 18 Apr 2020 15:14:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 02404862DE;
 Sat, 18 Apr 2020 15:14:17 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 494GhN3XV3zB09Zc;
 Sat, 18 Apr 2020 17:14:12 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Ys2kOrQf; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 2lcJkaGzkoJJ; Sat, 18 Apr 2020 17:14:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 494GhN2SjkzB09Zb;
 Sat, 18 Apr 2020 17:14:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587222852; bh=gkdO6wXUCMcpz7NxpipTTUJqjJLTk5RmhAdRmmr2lPk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ys2kOrQf8+IsQpw3uLxwRHJvEe2aifLm5D4UpWeMK0kDv1AR/2xUb1tP1bpBnc6tU
 /FXFqj/0reLL0AhKcAmepR4fiN+Nst88VgI4jysw3UkXqTDfBFUmEuw5zgvR7IUyfx
 GD8U+NDoD3gPnh1LMFlS4lGOU/NlhxN/aglDeXYA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 129F48BBCF;
 Sat, 18 Apr 2020 17:14:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CTX-Cucux1p0; Sat, 18 Apr 2020 17:14:14 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D8FE8B75E;
 Sat, 18 Apr 2020 17:14:13 +0200 (CEST)
Subject: Re: [PATCH] iommu: spapr_tce: Disable compile testing to fix build on
 book3s_32 config
To: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200414142630.21153-1-krzk@kernel.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a99ee461-664c-51ae-cb3a-cf5d87048d86@c-s.fr>
Date: Sat, 18 Apr 2020 15:14:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200414142630.21153-1-krzk@kernel.org>
Content-Language: en-US
Cc: linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 virtualization@lists.linux-foundation.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>



On 04/14/2020 02:26 PM, Krzysztof Kozlowski wrote:
> Although SPAPR_TCE_IOMMU itself can be compile tested on certain PowerPC
> configurations, its presence makes arch/powerpc/kvm/Makefile to select
> modules which do not build in such configuration.
> 
> The arch/powerpc/kvm/ modules use kvm_arch.spapr_tce_tables which exists
> only with CONFIG_PPC_BOOK3S_64.  However these modules are selected when
> COMPILE_TEST and SPAPR_TCE_IOMMU are chosen leading to build failures:
> 
>      In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20:0,
>                       from arch/powerpc/kvm/book3s_64_vio_hv.c:22:
>      arch/powerpc/include/asm/book3s/64/pgtable.h:17:0: error: "_PAGE_EXEC" redefined [-Werror]
>       #define _PAGE_EXEC  0x00001 /* execute permission */
> 
>      In file included from arch/powerpc/include/asm/book3s/32/pgtable.h:8:0,
>                       from arch/powerpc/include/asm/book3s/pgtable.h:8,
>                       from arch/powerpc/include/asm/pgtable.h:18,
>                       from include/linux/mm.h:95,
>                       from arch/powerpc/include/asm/io.h:29,
>                       from include/linux/io.h:13,
>                       from include/linux/irq.h:20,
>                       from arch/powerpc/include/asm/hardirq.h:6,
>                       from include/linux/hardirq.h:9,
>                       from include/linux/kvm_host.h:7,
>                       from arch/powerpc/kvm/book3s_64_vio_hv.c:12:
>      arch/powerpc/include/asm/book3s/32/hash.h:29:0: note: this is the location of the previous definition
>       #define _PAGE_EXEC 0x200 /* software: exec allowed */
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: e93a1695d7fb ("iommu: Enable compile testing for some of drivers")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   drivers/iommu/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 58b4a4dbfc78..3532b1ead19d 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -362,7 +362,7 @@ config IPMMU_VMSA
>   
>   config SPAPR_TCE_IOMMU
>   	bool "sPAPR TCE IOMMU Support"
> -	depends on PPC_POWERNV || PPC_PSERIES || (PPC && COMPILE_TEST)
> +	depends on PPC_POWERNV || PPC_PSERIES
>   	select IOMMU_API
>   	help
>   	  Enables bits of IOMMU API required by VFIO. The iommu_ops
> 

Should it be fixed the other way round, something like:

diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 2bfeaa13befb..906707d15810 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -135,4 +135,4 @@ obj-$(CONFIG_KVM_BOOK3S_32) += kvm.o
  obj-$(CONFIG_KVM_BOOK3S_64_PR) += kvm-pr.o
  obj-$(CONFIG_KVM_BOOK3S_64_HV) += kvm-hv.o

-obj-y += $(kvm-book3s_64-builtin-objs-y)
+obj-$(CONFIG_KVM_BOOK3S_64) += $(kvm-book3s_64-builtin-objs-y)


Christophe
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
