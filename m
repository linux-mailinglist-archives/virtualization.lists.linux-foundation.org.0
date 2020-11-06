Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF9C2A8B87
	for <lists.virtualization@lfdr.de>; Fri,  6 Nov 2020 01:39:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5A9652741E;
	Fri,  6 Nov 2020 00:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yn-ARCvTWusI; Fri,  6 Nov 2020 00:39:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A50C7273E3;
	Fri,  6 Nov 2020 00:39:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D66EC0889;
	Fri,  6 Nov 2020 00:39:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 918BDC0889
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 00:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 75977850E0
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 00:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHQcNEHsgi-2
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 00:39:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 83C5E850AD
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 00:39:49 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0ee50005b6d9c42d515134.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0e:e500:5b6:d9c4:2d51:5134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7EFA51EC03C1;
 Fri,  6 Nov 2020 01:39:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1604623186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=0szqA5V2pWQy1oA4esAc8Cd/+uPXvX7U+GvP5QW9eG0=;
 b=oy5kilDAaqW8D3fJeTgJuW3QylXyiVe5HYjaX0XPPDCel+XUQwGXzH6wjm1AGlYfxIs5no
 r4thFzHBCwhuHfpUfJa8XlGpAJRL7uq6QBovCno2DKVA2DD8a7HNrXRmIgMXeulu5FcMn0
 0235BOZ4bTQdtucU9xbEAGyFarjyBdQ=
Date: Fri, 6 Nov 2020 01:39:32 +0100
From: Borislav Petkov <bp@alien8.de>
To: Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v7 01/72] KVM: SVM: nested: Don't allocate VMCB
 structures on stack
Message-ID: <20201106003932.GQ25636@zn.tnic>
References: <20200907131613.12703-1-joro@8bytes.org>
 <20200907131613.12703-2-joro@8bytes.org>
 <160459347763.31546.3911053208379939674@vm0>
 <20201105163812.GE25636@zn.tnic>
 <20201106003153.wrr7zvjjl3hl2pec@vm0>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106003153.wrr7zvjjl3hl2pec@vm0>
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Erdem Aktas <erdemaktas@google.com>
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

On Thu, Nov 05, 2020 at 06:31:53PM -0600, Michael Roth wrote:
> I can confirm that patch fixes the issue. It is indeed a 5.9.1 tree, but
> looks like the SEV-ES patches didn't go in until v5.10-rc1

Yes, they went into 5.10-rc1 during the merge window.

> (this tree had a backport of them), so stable trees shouldn't be
> affected.

Ah, ok, that makes sense.

Thanks for checking!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
