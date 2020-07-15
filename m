Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C002201E6
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 03:34:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0A1C6870F6;
	Wed, 15 Jul 2020 01:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ih_Yy7ijLlKZ; Wed, 15 Jul 2020 01:34:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 959D987126;
	Wed, 15 Jul 2020 01:34:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F95AC0733;
	Wed, 15 Jul 2020 01:34:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56DE1C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 458DA89DA4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:34:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id StnwQ+jFfOOn
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:34:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9D50489D1B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:34:26 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id k5so1052139pjg.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 18:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zz6sLV8XJxd0lbywoq+z85UDCAeRpW0uEyFQlztJWmw=;
 b=KjZxK4Awqpk1vfXGfBYtI692U7BsBujqOCkBI+QG+yLB2j4Qw3QvteuLd4a70rZ1/c
 yaDe72GoCa2XdEfwiQXcF8IrP6J+bX89NN+6MR8q9jktHJFEmwVxwDVVvmr+PfDGg7Xe
 FDl+SZBUCt2yGQdyLb8rU0QxX4PkdOaDCRikM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zz6sLV8XJxd0lbywoq+z85UDCAeRpW0uEyFQlztJWmw=;
 b=SnmutOSBeGk9fkwXnZjMUlzN2dzSNv0d3ck5smMlVl02nbB6ZQFQgswhmMLLVrH2tu
 CM3JKkss4k0nKNPwWbX6B4NNoszq4VfgKKREds/2FZi10++GX8IQiikh4dXwUF/Qn6gJ
 SguMsOpp2FBa/GVhhDcXlzvV4IeFogSlmEJxw/KHW2NJg1nRV70Fy8FtXknkJ01ZKWfk
 ZAwgiqxMMy1tF0UZD5hPIX1xjqoIeBuv65+im9ctplIscaAO3drunKn3A5ix23Ihykkx
 scYYbnqUSmbbMYJeGLvcCaMW/Rzn82YhUr7VUvaAfTEP0irJwoapYveyKyTknPq6jdXw
 6mAg==
X-Gm-Message-State: AOAM531ByUDRwXvvcIjNueGNq7T2cj8nF+Kc/h4xVdAM23T0ty9vAFLf
 Twl/O3miEjQtLhQgNFFFwvaXQQ==
X-Google-Smtp-Source: ABdhPJyNqRvX4HpWN93/opBS43GZlWTdZSRq6ybyZkwfnv39UPGj+ErGvx/2WaJfYSwsGuR1sTBmcw==
X-Received: by 2002:a17:90a:1f87:: with SMTP id
 x7mr7556364pja.101.1594776866202; 
 Tue, 14 Jul 2020 18:34:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b18sm276216pju.10.2020.07.14.18.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 18:34:25 -0700 (PDT)
Date: Tue, 14 Jul 2020 18:34:24 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 34/75] x86/head/64: Build k/head64.c with
 -fno-stack-protector
Message-ID: <202007141831.F3165F22@keescook>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-35-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714120917.11253-35-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Cfir Cohen <cfir@google.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
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

On Tue, Jul 14, 2020 at 02:08:36PM +0200, Joerg Roedel wrote:
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
> index e77261db2391..1b166b866059 100644
> --- a/arch/x86/kernel/Makefile
> +++ b/arch/x86/kernel/Makefile
> @@ -39,6 +39,10 @@ ifdef CONFIG_FRAME_POINTER
>  OBJECT_FILES_NON_STANDARD_ftrace_$(BITS).o		:= y
>  endif
>  
> +# make sure head64.c is built without stack protector
> +nostackp := $(call cc-option, -fno-stack-protector)
> +CFLAGS_head64.o		:= $(nostackp)

Recent refactoring[1] for stack protector suggests this should just
unconditionally be:

CFLAGS_head64.o			+= -fno-stack-protector

But otherwise, yeah, this should be fine here -- it's all early init
stuff.

Reviewed-by: Kees Cook <keescook@chromium.org>

[1] https://lore.kernel.org/lkml/20200626185913.92890-1-masahiroy@kernel.org/

> +
>  # If instrumentation of this dir is enabled, boot hangs during first second.
>  # Probably could be more selective here, but note that files related to irqs,
>  # boot, dumpstack/stacktrace, etc are either non-interesting or can lead to
> -- 
> 2.27.0
> 

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
