Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7500D2110D8
	for <lists.virtualization@lfdr.de>; Wed,  1 Jul 2020 18:39:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 06279895B6;
	Wed,  1 Jul 2020 16:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7ljmWfKBi_L; Wed,  1 Jul 2020 16:39:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8CF4D895B3;
	Wed,  1 Jul 2020 16:39:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68A30C0733;
	Wed,  1 Jul 2020 16:39:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2ACADC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 16:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0B2462DD8E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 16:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cf76anGVh+Pa
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 16:39:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by silver.osuosl.org (Postfix) with ESMTPS id DE9D520109
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 16:38:59 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id d21so14054481lfb.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Jul 2020 09:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fS8Kbbr6u+Qt+wSwfOlztvSKvUpRcBAxdtJAIiraa8k=;
 b=XZM+72gciw9nF4OsUTlGCo821BFfCQbfWMzTG2s4XnB101NtlMstykJPODwJQkbk95
 ulAI4EpcU7fehmEn2OJ4hmH8jDQ3XUNp6wW631Zg/hLtnJKYYL3+untAdAvh1/2h4CHE
 Lh9Bbm1CmxMLsT/L4DDWco0F6ND+AFm+pljhj1WkhvSFKl/D82mKul+DFdHfQLZgsW/y
 tVXDXcRv5gLENn581TARIKvIeyvWyxbAYDXimInWetyiF1Q3I10t2k7nuQwrqWDIAfCH
 2FXDP4ok4ms1Zb2j1UZZbjokcvm5RNJEcKmP/XvftY1TPqLWeJtapVke08xVAMuAaW5X
 2Gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fS8Kbbr6u+Qt+wSwfOlztvSKvUpRcBAxdtJAIiraa8k=;
 b=Ycopyzp7Vb3WM2VNxq16Luevhu62b5eyY9ZtTxgPXkflMLs1wOR4V3ajAKeb4rgbQy
 Da1Imul428wML+xIFQZALtsE99MtqQjuojSX0qK6jv8af6yTDEm8x7SQKeXnAUqe6DCM
 VCGoa6kGpA1u0JOzz34Uml9udzU1FRES9aXS0qcOPjvT04FJT2LZJeiYcC/+io1bUlHO
 wHDzAWdifMOj1UuYgmf/vnTlgt5SLEXyPC/rMN7RAcxWE3BDlRDpZ6G2S/v1TfaMAdrb
 JeYAtAbTUCr+hj2MLCUxHEOPdXh3FeQpMDxjALVaqYqrh0F+4/Eyh66lhtP5jYsWG53N
 bcTQ==
X-Gm-Message-State: AOAM53177jnItPGCQFzNhGAKKEFoM/Kd/+EzF1Sc+F/7WREWLBapLtlu
 thKXPyGR6mQUSfhKuOEnAkelZ43i9FZFKbA6jy8=
X-Google-Smtp-Source: ABdhPJzhx/RMYa6L4vtQ0mrLwEP+eiVOtfSbexChh9nnu3NLhEZwqxpST5gp2Olwx3jPShY2dcl1VBrf6CxD/I+pfWE=
X-Received: by 2002:ac2:5e29:: with SMTP id o9mr15143828lfg.196.1593621538016; 
 Wed, 01 Jul 2020 09:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-2-will@kernel.org>
In-Reply-To: <20200630173734.14057-2-will@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 1 Jul 2020 09:38:46 -0700
Message-ID: <CAADnVQJ5kZRT+H7MZWKcJ6HqCGR54Y4zdk67KZO3=ho6Kab5fw@mail.gmail.com>
Subject: Re: [PATCH 01/18] tools: bpf: Use local copy of headers including
 uapi/linux/filter.h
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Xiao Yang <ice_yangxiao@163.com>,
 Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Borkmann <daniel@iogearbox.net>, Alan Stern <stern@rowland.harvard.edu>,
 Sami Tolvanen <samitolvanen@google.com>, Matt Turner <mattst88@gmail.com>,
 Android Kernel Team <kernel-team@android.com>, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org
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

On Tue, Jun 30, 2020 at 10:37 AM Will Deacon <will@kernel.org> wrote:
>
> Pulling header files directly out of the kernel sources for inclusion in
> userspace programs is highly error prone, not least because it bypasses
> the kbuild infrastructure entirely and so may end up referencing other
> header files that have not been generated.
>
> Subsequent patches will cause compiler.h to pull in the ungenerated
> asm/rwonce.h file via filter.h, breaking the build for tools/bpf:
>
>   | $ make -C tools/bpf
>   | make: Entering directory '/linux/tools/bpf'
>   |   CC       bpf_jit_disasm.o
>   |   LINK     bpf_jit_disasm
>   |   CC       bpf_dbg.o
>   | In file included from /linux/include/uapi/linux/filter.h:9,
>   |                  from /linux/tools/bpf/bpf_dbg.c:41:
>   | /linux/include/linux/compiler.h:247:10: fatal error: asm/rwonce.h: No such file or directory
>   |  #include <asm/rwonce.h>
>   |           ^~~~~~~~~~~~~~
>   | compilation terminated.
>   | make: *** [Makefile:61: bpf_dbg.o] Error 1
>   | make: Leaving directory '/linux/tools/bpf'
>
> Take a copy of the installed version of linux/filter.h  (i.e. the one
> created by the 'headers_install' target) into tools/include/uapi/linux/
> and adjust the BPF tool Makefile to reference the local include
> directories instead of those in the main source tree.
>
> Cc: Alexei Starovoitov <ast@kernel.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Suggested-by: Daniel Borkmann <daniel@iogearbox.net>
> Reported-by: Xiao Yang <ice_yangxiao@163.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Acked-by: Alexei Starovoitov <ast@kernel.org>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
