Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 77186159C69
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 23:45:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 23D3084647;
	Tue, 11 Feb 2020 22:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8i-ULOpzOP7a; Tue, 11 Feb 2020 22:45:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A8B9A8454E;
	Tue, 11 Feb 2020 22:45:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87D87C07FE;
	Tue, 11 Feb 2020 22:45:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B10DC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4521F838D9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48fZXVNdGAAZ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:44:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BE6008362E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:44:58 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DA4721734
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581461098;
 bh=HuV9YLvJEvcc270R9dgBn2WFOwx6DXWaFOZ23rncsqY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OXdXWAWEuPD/brdjHF+3LN1PlTCFVy6XDEEKUxvsVrajJaDDhNW+QNfi5q2+tFTor
 /+Rggqh3fb0KrBGOGo5vUTHH9UtuiRdaHtHzpuf43ULG7wlyVmRJDqGyhNQoumptQ7
 r30a6CfCJmEE4IfKRkkYGbWMiOOE9GfUNMXmGUJ0=
Received: by mail-wr1-f49.google.com with SMTP id y17so14587981wrh.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:44:58 -0800 (PST)
X-Gm-Message-State: APjAAAWRyHXDDX4EMBCVgS8QV1m4whDBdSAdG02HC92iTp5M1C4sGW4G
 ttstsbtjh5hQQe2idG8eYMvea4W2oqaIMmN3Lfb16A==
X-Google-Smtp-Source: APXvYqzY81lEi55il13Ueps9hjsu2+bqHRuf6w5qFMRFH7D2LrQCDHIcGTkWr/CLssKA2NO/90BHC3DwgTV3gYkiss8=
X-Received: by 2002:a5d:5305:: with SMTP id e5mr11114870wrv.18.1581461096590; 
 Tue, 11 Feb 2020 14:44:56 -0800 (PST)
MIME-Version: 1.0
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-31-joro@8bytes.org>
In-Reply-To: <20200211135256.24617-31-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 11 Feb 2020 14:44:45 -0800
X-Gmail-Original-Message-ID: <CALCETrVLhTkZ2MMUD+WMWXnhmSvwVhinUtMJey2M6sx_iUREcg@mail.gmail.com>
Message-ID: <CALCETrVLhTkZ2MMUD+WMWXnhmSvwVhinUtMJey2M6sx_iUREcg@mail.gmail.com>
Subject: Re: [PATCH 30/62] x86/head/64: Move early exception dispatch to C code
To: Joerg Roedel <joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
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

On Tue, Feb 11, 2020 at 5:53 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> From: Joerg Roedel <jroedel@suse.de>
>
> Move the assembly coded dispatch between page-faults and all other
> exceptions to C code to make it easier to maintain and extend.
>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/kernel/head64.c  | 20 ++++++++++++++++++++
>  arch/x86/kernel/head_64.S | 11 +----------
>  2 files changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
> index 7cdfb7113811..d83c62ebaa85 100644
> --- a/arch/x86/kernel/head64.c
> +++ b/arch/x86/kernel/head64.c
> @@ -36,6 +36,8 @@
>  #include <asm/microcode.h>
>  #include <asm/kasan.h>
>  #include <asm/fixmap.h>
> +#include <asm/extable.h>
> +#include <asm/trap_defs.h>
>
>  /*
>   * Manage page tables very early on.
> @@ -377,6 +379,24 @@ int __init early_make_pgtable(unsigned long address)
>         return __early_make_pgtable(address, pmd);
>  }
>
> +void __init early_exception(struct pt_regs *regs, int trapnr)
> +{
> +       unsigned long cr2;
> +       int r;

How about int (or bool) handled;  Or just if (!early_make_pgtable)
return;  This would also be nicer if you inverted the return value so
that true means "I handled it".

--Andy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
