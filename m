Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D04F3CED10
	for <lists.virtualization@lfdr.de>; Mon,  7 Oct 2019 21:58:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 27D3EC86;
	Mon,  7 Oct 2019 19:57:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 33B349D
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 19:57:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4806D8A0
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 19:57:55 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id s17so7366424plp.6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 07 Oct 2019 12:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Np1dLtH5+g3q/AtVMCx0wuJ5qYDTOY/aAWm/xM3OOGk=;
	b=igfx0QTx4y7VtszEETGCiZTm0y8asHQ6eEmdFVoL9g7fTrfLKBZRgwM+W2Wi/xCSgM
	cgkiRO0/0Uq6DR4AYrvB3a4grZXb+G3Ae9lAwi3zPBHqxQH9Ny3/FlttwAumHsF1AkDv
	966mLZmZlFON8x2mdvKdWNvciTbw+z01GLPpjdvk0l/nhTppD25EMEKxBaRRkJ32QOe2
	ERpDe5pDlfrc5LWWn5JnaBJg23OmIcm8hhR5hA4iU8QbOzvOKdTyjDm33Qc4aEENcGZO
	ftGSPOULiR3Sg1j+BRW4wxD3TEZQo/WU0mZFVEG6gSTWyN7npB0gD0U0j/dnewmLGNn9
	2qIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Np1dLtH5+g3q/AtVMCx0wuJ5qYDTOY/aAWm/xM3OOGk=;
	b=srVimV49ErCK8vpVYPAFz3jH5eLmyIjbDRK6jZ7JAGEnnRA3U0yv4FRYDWISsnTYuq
	rkNpW9KvaiuRUBC77GgAGhZ7paxXtEt5uRhNJjpRJMlhzqjQbHaHQWrPs7M1kauwBmfm
	wd5zEnH+/B7TlLO1KfnsypJ0+lkb81Qe+9r8enkZeTuVIoqAq8H7tnCbyRto0I3bFQLg
	zZvFOb7fe9egoigKodbHBEziK9OXOkLP3LWMFEh12/cdOFIBov0MYG/KZqWEoADuzRwA
	6UA1XchGbQ2jdRiF0Fr5sm5Gz7pAwRDVG5wR/7Mnmh0l0ZEX4nChwEC3hm4p/m+ZD0pY
	0W7g==
X-Gm-Message-State: APjAAAXHjjqRo6fUZPLPWO+3ZmGPi3UnC/UyNjeHaeGugnkYL1Lt4KnE
	ssFCZ9vM9wRqQVgriMoQa2eqxaBngi2XuSyZhIvcQQ==
X-Google-Smtp-Source: APXvYqwjh9Ggk/TxjNMMJIdTEz1W+GeMmNwhISVOmVSoKHUUfzPo/86Tlx5bba6VaWqXbiPA2cXo3oL9YXmixvNCoW4=
X-Received: by 2002:a17:902:820e:: with SMTP id
	x14mr30841969pln.223.1570478274285; 
	Mon, 07 Oct 2019 12:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191007192129.104336-1-samitolvanen@google.com>
In-Reply-To: <20191007192129.104336-1-samitolvanen@google.com>
Date: Mon, 7 Oct 2019 12:57:42 -0700
Message-ID: <CAKwvOd=hjxJYhU=C4wqkKKnLwuQjjL=wPAh6uBj-M8r8AtDdFA@mail.gmail.com>
Subject: Re: [PATCH] x86/cpu/vmware: use the full form of inl in VMWARE_PORT
To: Sami Tolvanen <samitolvanen@google.com>
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DOS_RCVD_IP_TWICE_B,RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Kees Cook <keescook@chromium.org>,
	pv-drivers@vmware.com,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	virtualization@lists.linux-foundation.org,
	clang-built-linux <clang-built-linux@googlegroups.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
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
From: Nick Desaulniers via Virtualization
	<virtualization@lists.linux-foundation.org>
Reply-To: Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Mon, Oct 7, 2019 at 12:21 PM 'Sami Tolvanen' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
>
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

Thanks Sami, this looks like it addresses:
Link: https://github.com/ClangBuiltLinux/linux/issues/734
Looks like GAS' testsuite has some cases where the second operand is
indeed implicitly %eax if unspecified. (This should still be fixed in
Clang).
Just to triple check that they're equivalent:
$ cat inl.s
  inl (%dx)
  inl (%dx), %eax
$ as inl.s
$ objdump -d a.out

a.out:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <.text>:
   0: ed                    in     (%dx),%eax
   1: ed                    in     (%dx),%eax

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

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
>  #define VMWARE_PORT(cmd, eax, ebx, ecx, edx)                           \
> -       __asm__("inl (%%dx)" :                                          \
> +       __asm__("inl (%%dx), %%eax" :                                   \
>                 "=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :            \
>                 "a"(VMWARE_HYPERVISOR_MAGIC),                           \
>                 "c"(VMWARE_CMD_##cmd),                                  \

-- 
Thanks,
~Nick Desaulniers
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
