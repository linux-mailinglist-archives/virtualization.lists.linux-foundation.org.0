Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0106FCEFF6
	for <lists.virtualization@lfdr.de>; Tue,  8 Oct 2019 02:44:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 64639CBC;
	Tue,  8 Oct 2019 00:44:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2D85DACD
	for <virtualization@lists.linux-foundation.org>;
	Tue,  8 Oct 2019 00:44:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D09DE14D
	for <virtualization@lists.linux-foundation.org>;
	Tue,  8 Oct 2019 00:44:17 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d22so7698170pls.0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 07 Oct 2019 17:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=trN9p3zclD944pvbb9tZbZNaEC++2nqbN3BsYHyRgOw=;
	b=PzUlYZNoVhkmjCptNa1nlzSUgMSP2rV6Ged4hfsi4S/xvDv/je1v8bY47TUWb+Yg2R
	XNpcAAQvMk4haiMNXCZ9Huy3tnKvTR/1SUmwdR41vqSYz8rGX8S2Kq/ANkPVhozxc6rw
	tmUe5yROO9KXOMlfLfvmRhvoBalPs5vR2rlPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=trN9p3zclD944pvbb9tZbZNaEC++2nqbN3BsYHyRgOw=;
	b=jN0V3HiSWv9NIC/iG8DcLvmIrbnMHeN+p6WhrBlgy82sxnEsfFAJ87esggIAyw96Xz
	U/Ye28brukd/glrlI7VVuEaIm2wWUP2gNsCYkifeZqzeZOUnZP/Rk2QtP3ZP4l0b88nX
	2VjJeZTl+QQyRcvmZsh7t5GS17n0OM+bZMzRNU7f1zrayx0qtLBQjktUYQ6boe5mT/pW
	6gRWxcQHwzIVgtWoQZToVRTXTLx1uRXnljriE/kJUFouctitw8EjqXax7ooL1XpxOxUI
	WCjiPKbPLJ2HYF/aoHJ+7Wp4hw2f++EV4P9a5WY29Gw4xB7/T4o2sMw2cQ2IoV4gSMs7
	vhKw==
X-Gm-Message-State: APjAAAWwyCNByFlXQhsuXZi9JFpKau/Ml2MYNSTTgA2oHkhQMk11g21j
	ZUT/NjCQAxEp6LiNwTwMEB72HQ==
X-Google-Smtp-Source: APXvYqzdJ/mhSn1BTB6qLFnsFwXt58tmYyMdG0quBKYRMfINxm+iXPMLqKu0taAuGj52o3zV8GHdQw==
X-Received: by 2002:a17:902:6b88:: with SMTP id
	p8mr22772868plk.74.1570495457346; 
	Mon, 07 Oct 2019 17:44:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	q13sm17744104pfn.150.2019.10.07.17.44.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 17:44:15 -0700 (PDT)
Date: Mon, 7 Oct 2019 17:44:14 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH] x86/cpu/vmware: use the full form of inl in VMWARE_PORT
Message-ID: <201910071743.1C48038A@keescook>
References: <20191007192129.104336-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007192129.104336-1-samitolvanen@google.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Thomas Hellstrom <thellstrom@vmware.com>, pv-drivers@vmware.com,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	clang-built-linux@googlegroups.com,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	hpa@zytor.com, Thomas Gleixner <tglx@linutronix.de>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Mon, Oct 07, 2019 at 12:21:29PM -0700, Sami Tolvanen wrote:
> LLVM's assembler doesn't accept the short form inl (%%dx) instruction,
> but instead insists on the output register to be explicitly specified:
> 
>   <inline asm>:1:7: error: invalid operand for instruction
>           inl (%dx)
>              ^
>   LLVM ERROR: Error parsing inline asm
> 
> Use the full form of the instruction to fix the build.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/x86/kernel/cpu/vmware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
> index 9735139cfdf8..46d732696c1c 100644
> --- a/arch/x86/kernel/cpu/vmware.c
> +++ b/arch/x86/kernel/cpu/vmware.c
> @@ -49,7 +49,7 @@
>  #define VMWARE_CMD_VCPU_RESERVED 31
>  
>  #define VMWARE_PORT(cmd, eax, ebx, ecx, edx)				\
> -	__asm__("inl (%%dx)" :						\
> +	__asm__("inl (%%dx), %%eax" :					\
>  		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
>  		"a"(VMWARE_HYPERVISOR_MAGIC),				\
>  		"c"(VMWARE_CMD_##cmd),					\
> -- 
> 2.23.0.581.g78d2f28ef7-goog
> 

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
