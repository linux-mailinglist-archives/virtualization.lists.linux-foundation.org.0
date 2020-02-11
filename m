Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F69159BFD
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 23:14:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 88600204C5;
	Tue, 11 Feb 2020 22:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QCCUlycPVtFf; Tue, 11 Feb 2020 22:14:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C80EC20502;
	Tue, 11 Feb 2020 22:14:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A72D7C07FE;
	Tue, 11 Feb 2020 22:14:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30A33C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1FB1385641
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4dO3pDkxIQzr
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:14:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 05D4685534
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:14:05 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B217217F4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581459244;
 bh=Tzo7oLihh6XmYdZ4fKdx4WcMxH4KEKF1Qm1JB/jwLwY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VpUH9q2Ld9f0sZfPeirYatwOo0AY9GNGwCayffYWwmErMNp068fBLBmJfdfSc/lE1
 1KTgyuEpfu3cUeSrxuONfZouwJuPNKBDZ+9U4pgZ1McQo3gStxCp/uwgNkRzBij3/W
 mVANOrP5chQlopRUZpNrxR4trUkQQr/2dH+S486o=
Received: by mail-wr1-f48.google.com with SMTP id y17so14510331wrh.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:14:04 -0800 (PST)
X-Gm-Message-State: APjAAAVE+7j2xjkh54FdxE5dMsbMF53oE0uzIpKLlOupq4B84OXc10Vi
 oUEU2xjMtLB/5U6Sfaq6u4z3vTSHXdAbZdEGivjPAA==
X-Google-Smtp-Source: APXvYqydo76PkEmj5PG5O27EmrWOjY3nLu09O+yXpO0pI2+Gs1e7Uz84BfjfNy+FRfjeX2dRElyHGQ0YcfBM+E5UZeM=
X-Received: by 2002:a5d:5305:: with SMTP id e5mr11001033wrv.18.1581459242661; 
 Tue, 11 Feb 2020 14:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-8-joro@8bytes.org>
In-Reply-To: <20200211135256.24617-8-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 11 Feb 2020 14:13:50 -0800
X-Gmail-Original-Message-ID: <CALCETrVVjECt2TNVDJcuS68663ioPTiEY13-1uO_gWYjWaVwPA@mail.gmail.com>
Message-ID: <CALCETrVVjECt2TNVDJcuS68663ioPTiEY13-1uO_gWYjWaVwPA@mail.gmail.com>
Subject: Re: [PATCH 07/62] x86/boot/compressed/64: Disable red-zone usage
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
> The x86-64 ABI defines a red-zone on the stack:
>
>   The 128-byte area beyond the location pointed to by %rsp is
>   considered to be reserved and shall not be modified by signal or
>   interrupt handlers. 10 Therefore, functions may use this area for
>   temporary data that is not needed across function calls. In
>   particular, leaf functions may use this area for their entire stack
>   frame, rather than adjusting the stack pointer in the prologue and
>   epilogue. This area is known as the red zone.
>
> This is not compatible with exception handling, so disable it for the
> pre-decompression boot code.

Acked-by: Andy Lutomirski <luto@kernel.org>

I admit that I thought we already supported exceptions this early.  At
least I seem to remember writing this code.  Maybe it never got
upstreamed?

--Andy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
