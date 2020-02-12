Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A444115B2EA
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 22:43:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 56A4286D82;
	Wed, 12 Feb 2020 21:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F7ouFdWe1y83; Wed, 12 Feb 2020 21:43:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F24C9865CD;
	Wed, 12 Feb 2020 21:43:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6596C0177;
	Wed, 12 Feb 2020 21:43:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B6AEC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 21:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 47B5A85427
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 21:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABx58yAJ0pHy
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 21:43:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D1A8C8538A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 21:43:01 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 621042467C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 21:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581543781;
 bh=/5bgUjnXfKX/YnWj2CVZ6tzhbOUyGqaE9iljMsoLSUs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Do9dVLKHn+WmiWvVm5KO1giK1zzBjXFPv4K+0KaPaAU+ZFrJMbe3xrdYLXsMD33YT
 HT5tMqSNvg8QkYnRPtiJswNABvk53TkuOMS9PFoWqhT46b6TsoN0KZCIMozqIyV4K8
 NqvZraXBlBMH2RxKnUB6a9FkfLoo3qPSZvOOkYtM=
Received: by mail-wm1-f42.google.com with SMTP id m10so5629729wmc.0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:43:01 -0800 (PST)
X-Gm-Message-State: APjAAAXfEUFnvgzpVxfGXadTZPDzqW0McSTphDFsZ2RCX1No3ic/AW7J
 1gR7wcrvRjSW3bTOONv1DN/ACspkC57jQwl4oIDdgw==
X-Google-Smtp-Source: APXvYqx80blFuMGO5xbOx9jMb15X8saJRfGQ59bhxN5COt5T4RVqjZzy0EMpurQDrd8Sxj4YjZioVGr2wj1eLccaOos=
X-Received: by 2002:a05:600c:2207:: with SMTP id
 z7mr1155941wml.138.1581543779800; 
 Wed, 12 Feb 2020 13:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-39-joro@8bytes.org>
In-Reply-To: <20200211135256.24617-39-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Wed, 12 Feb 2020 13:42:48 -0800
X-Gmail-Original-Message-ID: <CALCETrVRmg88xY0s4a2CONXQ3fgvCKXpW2eYJRJGhqQLneoGqQ@mail.gmail.com>
Message-ID: <CALCETrVRmg88xY0s4a2CONXQ3fgvCKXpW2eYJRJGhqQLneoGqQ@mail.gmail.com>
Subject: Re: [PATCH 38/62] x86/sev-es: Handle instruction fetches from
 user-space
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
> When a #VC exception is triggered by user-space the instruction
> decoder needs to read the instruction bytes from user addresses.
> Enhance es_fetch_insn_byte() to safely fetch kernel and user
> instruction bytes.

I realize that this is a somewhat arbitrary point in the series to
complain about this, but: the kernel already has infrastructure to
decode and fix up an instruction-based exception.  See
fixup_umip_exception().  Please refactor code so that you can share
the same infrastructure rather than creating an entirely new thing.

FWIW, the fixup_umip_exception() code seems to have much more robust
segment handling than yours :)

--Andy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
