Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCF321BBF9
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 19:13:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EF7868973F;
	Fri, 10 Jul 2020 17:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m7tTBS3usQa1; Fri, 10 Jul 2020 17:13:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 53D2389A67;
	Fri, 10 Jul 2020 17:13:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32592C016F;
	Fri, 10 Jul 2020 17:13:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68B63C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 17:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 63F93889EC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 17:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qMX3mz3RU4hk
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 17:13:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A63E587B04
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 17:13:35 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id j11so5348943oiw.12
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hUUzdCZO7cOEjM8UPSu4KBBKoTC+8Tu1Me77yU74KLk=;
 b=UZTVAEzHrsDgJP78s0HloMVAuOUv3FwX+DkXiwaS0QhCqsLNWEjmofaPfN4D13+xg+
 BXiB46hVqKuzlU7JoyckRiIHwh8eGyd8gGxEi9O1BwL+1P/cRbqBwVU3NWsmo3jSL4l9
 sK2C6Hhp6l7SFYFGpy9L6KyQhlcX5x0cBHA3os+6EbKa6iuTXdVzIjwVL4gp0efhbmKq
 3q4cS8CGyGDDCIUSAV4fAFNjDW+GCUveiPds2A4egvjqPn80FdFfufNw0eG/H0hGL++P
 aVvXZMeqKdhDD7WWZzYD19p+Cqs1MhDi+umLiVd5HPTI/xU3ULgd5VV28V7wtZ5UHeRv
 5k8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hUUzdCZO7cOEjM8UPSu4KBBKoTC+8Tu1Me77yU74KLk=;
 b=p7NzyAqHJVyicwWq/5huNlZeGx6DFNPo/6ebEMeh5llWUqSuuX1HHe8jF6q3KfQbhO
 SGsgrYj9oZ7ZKuk4bbcWXHU0fV+GbALlM3GlmlKCQdMT4A9hhS8uxrfm0tV9LxQoZXUu
 SB5t7ef2ieu1Mpp6qjB0d3tXQOYFz/7A+V12HQZI1OZtoOaBCCUAcYWEFHqsQm2T5/G6
 5hfRo4zLiQ22RgGUv05AADOQOelz2LwGrd2uqj/3nl5dLPpe7msGMrFoHSSx3tuk0agj
 mkWcZMmikOF9g4cO4sE6tp2fH21koiIfWN/B5rj33Bd9io+uW/RABfCTSMmgzdteYb4Z
 kSvQ==
X-Gm-Message-State: AOAM53190QuU0Oag0H/OlJgGn3yonWRZ7zJK0/4uwyZFnOR1F/TI7MwB
 FZtBf3UgksOStAG5pRfCrPbiZeBlCGrrqZtmEChuKOK5
X-Google-Smtp-Source: ABdhPJwRQBEK6dyNFlDfbU4Yt4nNc6ZeNycLC+s5xlWnA3CaJIsX3y9fd/e3NodN8pbHV0qttAg1iJmTBh6hiUMsM6Q=
X-Received: by 2002:a17:90a:21ef:: with SMTP id
 q102mr6946097pjc.101.1594400784244; 
 Fri, 10 Jul 2020 10:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200710165203.31284-1-will@kernel.org>
 <20200710165203.31284-7-will@kernel.org>
In-Reply-To: <20200710165203.31284-7-will@kernel.org>
Date: Fri, 10 Jul 2020 10:06:12 -0700
Message-ID: <CAKwvOd=HJye0iHr=9=7EMytO8ycFNJEsHHe1m64uT8s0jOQw0Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/19] asm/rwonce: Don't pull <asm/barrier.h> into
 'asm-generic/rwonce.h'
To: Will Deacon <will@kernel.org>
Cc: Joel Fernandes <joelaf@google.com>, Mark Rutland <mark.rutland@arm.com>,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>, linux-alpha@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>, Matt Turner <mattst88@gmail.com>,
 kernel-team <kernel-team@android.com>, Boqun Feng <boqun.feng@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>
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
From: Nick Desaulniers via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, Jul 10, 2020 at 9:52 AM Will Deacon <will@kernel.org> wrote:
>
> Now that 'smp_read_barrier_depends()' has gone the way of the Norwegian
> Blue, drop the inclusion of <asm/barrier.h> in 'asm-generic/rwonce.h'.
>
> This requires fixups to some architecture vdso headers which were
> previously relying on 'asm/barrier.h' coming in via 'linux/compiler.h'.
>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm/include/asm/vdso/gettimeofday.h          | 1 +
>  arch/arm64/include/asm/vdso/compat_gettimeofday.h | 1 +
>  arch/arm64/include/asm/vdso/gettimeofday.h        | 1 +
>  arch/riscv/include/asm/vdso/gettimeofday.h        | 1 +
>  include/asm-generic/rwonce.h                      | 2 --
>  include/linux/nospec.h                            | 2 ++
>  6 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/include/asm/vdso/gettimeofday.h b/arch/arm/include/asm/vdso/gettimeofday.h
> index 36dc18553ed8..1b207cf07697 100644
> --- a/arch/arm/include/asm/vdso/gettimeofday.h
> +++ b/arch/arm/include/asm/vdso/gettimeofday.h
> @@ -7,6 +7,7 @@
>
>  #ifndef __ASSEMBLY__
>
> +#include <asm/barrier.h>
>  #include <asm/errno.h>
>  #include <asm/unistd.h>
>  #include <asm/vdso/cp15.h>
> diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
> index b6907ae78e53..bcf7649999a4 100644
> --- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
> +++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
> @@ -7,6 +7,7 @@
>
>  #ifndef __ASSEMBLY__
>
> +#include <asm/barrier.h>
>  #include <asm/unistd.h>
>  #include <asm/errno.h>
>
> diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
> index afba6ba332f8..127fa63893e2 100644
> --- a/arch/arm64/include/asm/vdso/gettimeofday.h
> +++ b/arch/arm64/include/asm/vdso/gettimeofday.h
> @@ -7,6 +7,7 @@
>
>  #ifndef __ASSEMBLY__
>
> +#include <asm/barrier.h>
>  #include <asm/unistd.h>
>
>  #define VDSO_HAS_CLOCK_GETRES          1
> diff --git a/arch/riscv/include/asm/vdso/gettimeofday.h b/arch/riscv/include/asm/vdso/gettimeofday.h
> index c8e818688ec1..3099362d9f26 100644
> --- a/arch/riscv/include/asm/vdso/gettimeofday.h
> +++ b/arch/riscv/include/asm/vdso/gettimeofday.h
> @@ -4,6 +4,7 @@
>
>  #ifndef __ASSEMBLY__
>
> +#include <asm/barrier.h>
>  #include <asm/unistd.h>
>  #include <asm/csr.h>
>  #include <uapi/linux/time.h>
> diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
> index cc810f1f18ca..cd0302746fb4 100644
> --- a/include/asm-generic/rwonce.h
> +++ b/include/asm-generic/rwonce.h
> @@ -26,8 +26,6 @@
>  #include <linux/kasan-checks.h>
>  #include <linux/kcsan-checks.h>
>
> -#include <asm/barrier.h>
> -
>  /*
>   * Use __READ_ONCE() instead of READ_ONCE() if you do not require any
>   * atomicity. Note that this may result in tears!
> diff --git a/include/linux/nospec.h b/include/linux/nospec.h
> index 0c5ef54fd416..c1e79f72cd89 100644
> --- a/include/linux/nospec.h
> +++ b/include/linux/nospec.h
> @@ -5,6 +5,8 @@
>
>  #ifndef _LINUX_NOSPEC_H
>  #define _LINUX_NOSPEC_H
> +
> +#include <linux/compiler.h>

The other hunks LGTM, but this one is a little more curious to me. Can
you walk me through this addition?

>  #include <asm/barrier.h>
>
>  struct task_struct;
> --
> 2.27.0.383.g050319c2ae-goog
>


-- 
Thanks,
~Nick Desaulniers
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
