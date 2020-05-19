Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5BD1D98B1
	for <lists.virtualization@lfdr.de>; Tue, 19 May 2020 15:58:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0332486594;
	Tue, 19 May 2020 13:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsr5yxQPW2zY; Tue, 19 May 2020 13:58:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7B26686463;
	Tue, 19 May 2020 13:58:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59195C0176;
	Tue, 19 May 2020 13:58:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BFB8C0176
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 May 2020 13:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4602087E34
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 May 2020 13:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p0g3rYN4-NH3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 May 2020 13:58:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9ACB687E2E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 May 2020 13:58:30 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id a14so8121099ilk.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 May 2020 06:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n/gSlFWBQ3WxUydL0AG8RE+72oWOYudYm1JYvsV0Jus=;
 b=fIB4BbVzW7vbkqKGKgmfgtVqfdtPo/YxHVrbHEHcSalctsC8Z1P/ZiMcrHG884CH/T
 afZBfItuIrHPolRnpDDBn4+sdZVpYdBP5S8xbLo8cNmXYVc3M3DKaokQsaNWUl5Eee1q
 ohpVvVCyMv3GJPSnXR2UI5aTBr1vw6bJFKDym5a0inaHP2eR4oVmhV2+MmFLuWT7+8oA
 D6utLisJgmRj2Sw/p3vERjIrCk/Z+7QU6dsaBHzi6SVKJ0Ka+J/P8e2p3L9mlquNKTpN
 fOzkHLkJefEIFpPUiQ8deUjtHUVX0E6KZqO2L9VevMlZVippSZ+9Y+HHF0Wrewa+mmPP
 Qp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n/gSlFWBQ3WxUydL0AG8RE+72oWOYudYm1JYvsV0Jus=;
 b=I2lWDfEdTlaMa1AXASrRT3aqn3eKSvMaZB+CDUYBRXmcyJ9IObAq7EK+I9puk3A5yp
 1I+bqSRnaTyHhSqqyg8Zgvs9DarehMbJEVLDgrqHPln3woQz0k3d2tRnEphQdL3VVQ+A
 kImXIlJrBbKwdr1Kvd4rpjMT7mmfplfeQQd0d1yoHbVFwzFKEQWQGdfzgbUBkhmN90dU
 wzHvebwFJFGRTpY+Dj30mIz9puJdcq2Ig1kDpK1FGhemI48wM4OEV6IZ4ZXSg+vIz+lg
 8fKDbQdozw/GOkozLo7rmNKVzUsmFd89n1jYQ0NHg/tXvizLXBtqGR/g1vkcvCmfVWhv
 efOw==
X-Gm-Message-State: AOAM533XCwoNBGNY59qIV/+VCQVB/iHuQnG8P9mZ7jmoxupzZjlJQbU2
 OHxC+ixFyjuviXb6HMw8kXYbEhnikmLJYCX1tg==
X-Google-Smtp-Source: ABdhPJyzDk5ro9RaDhHf25IEza5E1ffJM8beDQGW8MgdSO58MbiCno3wYKG45cNLis7uZ+kYFAz0+QOPkms+WREOc3I=
X-Received: by 2002:a92:8c4c:: with SMTP id o73mr21114094ild.172.1589896709896; 
 Tue, 19 May 2020 06:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-36-joro@8bytes.org>
In-Reply-To: <20200428151725.31091-36-joro@8bytes.org>
From: Brian Gerst <brgerst@gmail.com>
Date: Tue, 19 May 2020 09:58:18 -0400
Message-ID: <CAMzpN2gfiBAeCV_1+9ogh42bMMuDW=qdwd7dYp49-=zY3kzBaA@mail.gmail.com>
Subject: Re: [PATCH v3 35/75] x86/head/64: Build k/head64.c with
 -fno-stack-protector
To: Joerg Roedel <joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm list <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Erdem Aktas <erdemaktas@google.com>, David Rientjes <rientjes@google.com>,
 Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>
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

On Tue, Apr 28, 2020 at 11:28 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> From: Joerg Roedel <jroedel@suse.de>
>
> The code inserted by the stack protector does not work in the early
> boot environment because it uses the GS segment, at least with memory
> encryption enabled. Make sure the early code is compiled without this
> feature enabled.
>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/kernel/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
> index ba89cabe5fcf..1192de38fa56 100644
> --- a/arch/x86/kernel/Makefile
> +++ b/arch/x86/kernel/Makefile
> @@ -35,6 +35,10 @@ ifdef CONFIG_FRAME_POINTER
>  OBJECT_FILES_NON_STANDARD_ftrace_$(BITS).o             := y
>  endif
>
> +# make sure head64.c is built without stack protector
> +nostackp := $(call cc-option, -fno-stack-protector)
> +CFLAGS_head64.o                := $(nostackp)
> +
>  # If instrumentation of this dir is enabled, boot hangs during first second.
>  # Probably could be more selective here, but note that files related to irqs,
>  # boot, dumpstack/stacktrace, etc are either non-interesting or can lead to

The proper fix would be to initialize MSR_GS_BASE earlier.

--
Brian Gerst
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
