Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DA17A159C8E
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 23:50:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7E2CE2038D;
	Tue, 11 Feb 2020 22:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hIqS2z9-dM5l; Tue, 11 Feb 2020 22:50:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8630B204B8;
	Tue, 11 Feb 2020 22:50:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66064C07FE;
	Tue, 11 Feb 2020 22:50:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96CAAC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 910C78464A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eLoyctbwcxir
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:50:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4B4FB81FB3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:50:43 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A68D620848
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581461442;
 bh=XV1MMCtQP/VUtU4M6HqgIW/VlmatPHwn+NBw1GlBfxE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=II3HgMfbxENGctvOMjFOHZA/hx7inxXCtRZH3Te8aprNZIdAdJsUNs+3sM2QpGRvJ
 CbVr+cNo2HNTPixkDuyq8S/Lq/nYAuAdr2NXdJJ8wDJ2S5PlEzMIoKrpOvqls66FUK
 zzAtfoGqfwhafGxEuPDZBqnTgkd0DFqnEZHX/VYU=
Received: by mail-wr1-f50.google.com with SMTP id y17so14600683wrh.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:50:42 -0800 (PST)
X-Gm-Message-State: APjAAAWtTuXzV9Hy1l9UCzdf7RFJjpZ1Uw/nyw2yggq1zY2cNTDIDt5A
 VmRXZ9wCSMaWbiwT8yrdDhzYydxsT0YLEQmq4U9uiA==
X-Google-Smtp-Source: APXvYqzqJ1AlSDY2ZRDO05AMScFqgtaEyb1UuVzqt0WKNedpg8GD4u5J3WkIoYB+03YMjv6Q0h3O47HFfxgY+9Q1m0c=
X-Received: by 2002:adf:a354:: with SMTP id d20mr10861134wrb.257.1581461441006; 
 Tue, 11 Feb 2020 14:50:41 -0800 (PST)
MIME-Version: 1.0
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-63-joro@8bytes.org>
In-Reply-To: <20200211135256.24617-63-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 11 Feb 2020 14:50:29 -0800
X-Gmail-Original-Message-ID: <CALCETrWV15+YTGsEwUHBSjT2MYappLANw4fQHjgZgei2UyV1JQ@mail.gmail.com>
Message-ID: <CALCETrWV15+YTGsEwUHBSjT2MYappLANw4fQHjgZgei2UyV1JQ@mail.gmail.com>
Subject: Re: [PATCH 62/62] x86/sev-es: Add NMI state tracking
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
> Keep NMI state in SEV-ES code so the kernel can re-enable NMIs for the
> vCPU when it reaches IRET.

This patch is overcomplicated IMO.  Just do the magic incantation in C
from do_nmi or from here:

        /*
         * For ease of testing, unmask NMIs right away.  Disabled by
         * default because IRET is very expensive.

If you do the latter, you'll need to handle the case where the NMI
came from user mode.

The ideal solution is do_nmi, I think.

if (static_cpu_has(X86_BUG_AMD_FORGOT_ABOUT_NMI))
  sev_es_unmask_nmi();

Feel free to use X86_FEATURE_SEV_ES instead :)

--Andu
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
