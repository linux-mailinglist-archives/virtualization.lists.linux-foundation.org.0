Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BF89815F6FB
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 20:40:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7641286A42;
	Fri, 14 Feb 2020 19:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3f3eCi4zIP6R; Fri, 14 Feb 2020 19:40:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E0F0486A3D;
	Fri, 14 Feb 2020 19:40:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0A0BC0177;
	Fri, 14 Feb 2020 19:40:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F17BEC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 19:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E057622721
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 19:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yrh0Loohspo5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 19:40:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by silver.osuosl.org (Postfix) with ESMTPS id A4AF122708
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 19:40:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2020 11:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,441,1574150400"; d="scan'208";a="238451500"
Received: from tassilo.jf.intel.com (HELO tassilo.localdomain) ([10.7.201.21])
 by orsmga006.jf.intel.com with ESMTP; 14 Feb 2020 11:40:36 -0800
Received: by tassilo.localdomain (Postfix, from userid 1000)
 id B9EC13018B1; Fri, 14 Feb 2020 11:40:36 -0800 (PST)
From: Andi Kleen <ak@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 08/62] x86/boot/compressed/64: Add IDT Infrastructure
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-9-joro@8bytes.org>
Date: Fri, 14 Feb 2020 11:40:36 -0800
In-Reply-To: <20200211135256.24617-9-joro@8bytes.org> (Joerg Roedel's message
 of "Tue, 11 Feb 2020 14:52:02 +0100")
Message-ID: <87k14p5557.fsf@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

Joerg Roedel <joro@8bytes.org> writes:
> +	addq    $8, %rsp
> +
> +	/*
> +	 * Make sure we return to __KERNEL_CS - the CS selector on
> +	 * the IRET frame might still be from an old BIOS GDT
> +	 */
> +	movq	$__KERNEL_CS, 8(%rsp)

This doesn't make sense. Either it's running on the correct CS
before the exception or not. Likely there's some other problem
here that you patched over with this hack.

-Andi
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
