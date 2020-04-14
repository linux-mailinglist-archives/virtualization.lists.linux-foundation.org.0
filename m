Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 524091A794A
	for <lists.virtualization@lfdr.de>; Tue, 14 Apr 2020 13:19:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C802B203DB;
	Tue, 14 Apr 2020 11:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6u9BzAJrYETQ; Tue, 14 Apr 2020 11:19:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7D1782038F;
	Tue, 14 Apr 2020 11:19:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DACFC0172;
	Tue, 14 Apr 2020 11:19:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8234DC0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 11:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6C3CF86FE7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 11:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WTNGEaz-7nh6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 11:19:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3454586F88
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 11:19:08 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id s29so11058671edc.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 04:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kLr1otCrFIODbPMjYkvy3aKgept10MpBYq6j6d3c97s=;
 b=Sufsf9ar24ySJRxiM/SOPFBEnIucx0p1TdHdJfTz55z6aLmlp1780rTmoG25W9e45R
 F43hg2DR5zm3fG89P/+61oRv7kpUW2OVHUE7AQ7OM1JKAY+DSTA2/FN+kmLgp//+1JgE
 H1WRf6ngM2p2obrUoKVnFdiOKIc6YKXTHazSZnaflWzcVZoCSpSEoDCd2DHhBccwU3+f
 9NpoFeSYhBV4bb/4B560I0nLiax513v4RDeJ4ZtF0C8oMFkeGsaQv3SDD41G/Z0o39Vd
 zZIZFLYYOYNK2Z46tXwUpDHYO+izpSB4FPsXYgaAGfmU3P+p5wf9AcKaBj8zbke555Ce
 fORw==
X-Gm-Message-State: AGi0PubJWR+8/9v5rXibU65SzTPZ3CLyUdbVwersMKpfcwBVdGsv5z5V
 V3n143LrD5y/9kNepZSnPJo=
X-Google-Smtp-Source: APiQypI+e8NhZbH4s6s1t6e787WWdZVnlyyo3DThuzngTxyATZQvoEtvVJUA6KnpSKeyc8xiorGa1Q==
X-Received: by 2002:a17:906:7e19:: with SMTP id
 e25mr20500556ejr.358.1586863146621; 
 Tue, 14 Apr 2020 04:19:06 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id j5sm1662117edh.4.2020.04.14.04.19.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Apr 2020 04:19:05 -0700 (PDT)
Date: Tue, 14 Apr 2020 13:19:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Build regressions/improvements in v5.7-rc1
Message-ID: <20200414111903.GA1895@kozik-lap>
References: <20200413093100.24470-1-geert@linux-m68k.org>
 <alpine.DEB.2.21.2004131232220.32713@ramsan.of.borg>
 <877dyijrh7.fsf@mpe.ellerman.id.au>
 <20200414110627.GA1373@kozik-lap>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414110627.GA1373@kozik-lap>
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

On Tue, Apr 14, 2020 at 01:06:27PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Apr 14, 2020 at 08:23:32PM +1000, Michael Ellerman wrote:
 > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable-4k.h: error: expected ')' before '!=' token:  => 58:40
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable-4k.h: error: expected ')' before '==' token:  => 57:37
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable-4k.h: error: expected identifier or '(' before '!' token:  => 56:25
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable.h: error: expected ')' before '!=' token:  => 163:40
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable.h: error: expected ')' before '==' token:  => 333:50
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable.h: error: expected ')' before '^' token:  => 333:36
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable.h: error: expected identifier or '(' before '!' token:  => 146:27, 144:24, 160:25, 161:24, 143:25
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable.h: error: expected identifier or '(' before 'struct':  => 77:21
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/pgtable.h: error: redefinition of 'pgd_huge':  => 291:19
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/pte-book3e.h: error: redefinition of 'pte_mkprivileged':  => 108:26
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/pte-book3e.h: error: redefinition of 'pte_mkuser':  => 115:20
> > >>  + /kisskb/src/arch/powerpc/kvm/book3s_64_vio_hv.c: error: 'struct kvm_arch' has no member named 'spapr_tce_tables':  => 68:46, 68:2
> > >
> > > ppc64_book3e_allmodconfig
> > 
> > Caused by:
> > 
> > e93a1695d7fb ("iommu: Enable compile testing for some of drivers")
> > 
> > Which did:
> > 
> >  config SPAPR_TCE_IOMMU
> >  	bool "sPAPR TCE IOMMU Support"
> > -	depends on PPC_POWERNV || PPC_PSERIES
> > +	depends on PPC_POWERNV || PPC_PSERIES || (PPC && COMPILE_TEST)
> > 
> > 
> > Which is just ... not right, the dependencies on the correct platform
> > are important, otherwise the build breaks.
> 
> The SPAPR_TCE_IOMMU should compile fine.  The actual trouble here is
> that KVM_BOOK3S_64 selects SPAPR_TCE_IOMMU which is a user-visible
> symbol.  This is generally discouraged because of exactly this error -
> select ignores any dependencies.
> 
> I can revert the COMPILE_TEST for SPAPR_TCE_IOMMU or change
> select->depends in KVM_BOOK3S_64.  I think the latter is the proper
> change here.

Eh, not really, it looks more complex because there are more
dependencies (the book3s_64_vio_hv is pulled by KVM Makefile if
SPAPR_TCE_IOMMU is set).

I guess the revert of this part makes most sense.

Best regards,
Krzysztof

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
