Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6AF159C63
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 23:41:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8CFE82051A;
	Tue, 11 Feb 2020 22:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qAcBdE9b9T5d; Tue, 11 Feb 2020 22:41:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1B4F420502;
	Tue, 11 Feb 2020 22:41:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09C60C07FE;
	Tue, 11 Feb 2020 22:41:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99589C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9500E87A34
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g0k4w-8gspAv
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:41:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2CF44879A3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:41:39 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B5C4620842
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581460899;
 bh=po7kqC7Pvn8ouUFSjitvJdsV90ZhZQbIOK4MtOWD+4c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A9SjsBEnM3jsARVQH6Vr8mTRFYVGhigujF6r85gkGJDQV5NSgyXGAldP+bLnXh/9J
 3m3NtP+kcfOzMI6mAYyqirz9/jX0YVwfQ8kfmP5qG/FH5JKPQCzOSv87B8D9c6/iCa
 ssCsOD+3rbZeEUyj8gwWEpLOQGnncSrhXwJy9lZ0=
Received: by mail-wr1-f41.google.com with SMTP id y11so14600541wrt.6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:41:38 -0800 (PST)
X-Gm-Message-State: APjAAAXB3ycdMUFhAdh46O3FHIgGSy8ocoW9+2RqZEZf+a4ZW+ehnCLA
 9KxOmRLx34CK9QTI7Cc6pSFfnsWSMpMmCsXZ5i4i+w==
X-Google-Smtp-Source: APXvYqwUKxKnR3eGbA73IwMOx/C58CVPpQncokUat63UmXlmSlb5cTd+e+rYF11OC5oIS9uMBg3BBmcyseI9oUikD18=
X-Received: by 2002:a5d:5305:: with SMTP id e5mr11103645wrv.18.1581460897210; 
 Tue, 11 Feb 2020 14:41:37 -0800 (PST)
MIME-Version: 1.0
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-24-joro@8bytes.org>
In-Reply-To: <20200211135256.24617-24-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 11 Feb 2020 14:41:25 -0800
X-Gmail-Original-Message-ID: <CALCETrXswGgGoNaZigboUn3-amTyCY2Ft_JaMMvXchLDDkhJfw@mail.gmail.com>
Message-ID: <CALCETrXswGgGoNaZigboUn3-amTyCY2Ft_JaMMvXchLDDkhJfw@mail.gmail.com>
Subject: Re: [PATCH 23/62] x86/idt: Move IDT to data segment
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
> With SEV-ES, exception handling is needed very early, even before the
> kernel has cleared the bss segment. In order to prevent clearing the
> currently used IDT, move the IDT to the data segment.

Ugh.  At the very least this needs a comment in the code.

I had a patch to fix the kernel ELF loader to clear BSS, which would
fix this problem once and for all, but it didn't work due to the messy
way that the decompressor handles memory.  I never got around to
fixing this, sadly.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
