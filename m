Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3333C3E2CF1
	for <lists.virtualization@lfdr.de>; Fri,  6 Aug 2021 16:52:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C64B5404A0;
	Fri,  6 Aug 2021 14:52:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMBrFJlDXGDw; Fri,  6 Aug 2021 14:52:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B831C4065B;
	Fri,  6 Aug 2021 14:52:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4836AC000E;
	Fri,  6 Aug 2021 14:52:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11C0EC000E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Aug 2021 14:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C765405F5
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Aug 2021 14:52:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPNj_aKxuJ3H
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Aug 2021 14:52:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28D3740628
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Aug 2021 14:52:06 +0000 (UTC)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MlfL0-1mujtG0yuY-00inkV for <virtualization@lists.linux-foundation.org>;
 Fri, 06 Aug 2021 16:52:04 +0200
Received: by mail-wr1-f47.google.com with SMTP id c9so11397166wri.8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 06 Aug 2021 07:52:04 -0700 (PDT)
X-Gm-Message-State: AOAM531vi0gLOasp/r1B9sEPRovWfGbr8lXpPvM851IJ7FX/z9lUUZKy
 ZtsxbiFRabmXclrxow9zm6Mp2jiSSpnSmtX0gL0=
X-Google-Smtp-Source: ABdhPJzaR6qJfePFLgCHPEvS2rl+ctcdCp7KoQ3Fcdv85XiJXg5JdFJiE2fEE5Q5uLbt8pe01lz22DOOlzKs3X1rUrA=
X-Received: by 2002:adf:f446:: with SMTP id f6mr11689710wrp.361.1628261523856; 
 Fri, 06 Aug 2021 07:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210806030138.123479-1-xianting.tian@linux.alibaba.com>
 <20210806030138.123479-2-xianting.tian@linux.alibaba.com>
In-Reply-To: <20210806030138.123479-2-xianting.tian@linux.alibaba.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 6 Aug 2021 16:51:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2=BmVv0tvUKaca+LYxuAussAJtAJW9O3fRN2CbV2-9aw@mail.gmail.com>
Message-ID: <CAK8P3a2=BmVv0tvUKaca+LYxuAussAJtAJW9O3fRN2CbV2-9aw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] tty: hvc: pass DMA capable memory to put_chars()
To: Xianting Tian <xianting.tian@linux.alibaba.com>
X-Provags-ID: V03:K1:OFhpfsKLcsQV4t0EYb6IvtJoSrA+DPNk8VVbxwUrYDYSQeq2tgK
 uRsgFr2cTHk71iFSJV7eaEtKVkAeUxlPWCXMKJDETuMLUQu9+bnlXfvQN+NnIaoewpFVTkv
 tiCJS9zNqM5HSKkMZ4TB+qkLlr9fz+d0Z8MorbOLXN+U5yds6vq9Ad82+U3s/u4sdD5ZmGm
 sKJVx+p2VfcMgcJIASx+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tepUAV1ISzU=:JR4XUVcq6mxQLw7oD8owlB
 pwTWJkJAaIzuJ3TE3Y4pNCN9ZvegoQsABBg00WGEGsk9ADXKiNXRiSKD2uZ0aoR9pI3nrvGrN
 DfUQSZJ3XxMlkT2O5FcFBrQ2desUJsKJARnCOAfF7SIMbjoy+wttOUBRuD4mYOzNIGfI+DFJo
 iBuOIR9pCw8h8hdu89VL9lbu9Fkhx1OtGyRq5Yjw3H+j7l0lEN3LEmPc+YzDKcI+7SED8IFv/
 gzHHaHmwK+2Th3UWd3e+2q3sohJnO8ruWPvuYtO9gFKhu48ofvy8p8n+N9mSu9QyGyYfVvOZj
 dojcqa8brvWvlniIudyFDsiZgc2H1itciq6+W71P4doEJVrYPxRDmqtnXZbeoix2x0NekkHXJ
 TWWZEMyUmRKRWQGx762PgF+tXq3FnyGqPHG8oVAbvp9E6AyqgWZbUcGdHuYWfJ8OPKVJiCjC4
 On3GlurWJ/4xocaFPL2cpIQyc4F4qeZ1eMu8b/KlCF3tSpQtwN3UQ0fp1dJXklpgZoVXVpnro
 YXmh3JuI2rflfDC9bDWjIBb4BkMcatVLYQemfr9ph/qMj//Jh81YAtAC5TKQs9LnT1zz1Xyvb
 lYsFyHkgB6yoqu7CUzwSGJSx0i6SwzoaLh47h1MFu9wh5yiXd/7KQOcGeWiagkhCDaa8Pn24n
 ary00BZO2oD4esSqblfuR6poUs2xFLDvVudhaSprOK4QOfgzL/d/MMSyjIHrVjfQoH6ZKOcXq
 9Gps8eWE4lxrH7+1amd18D/BANpK/srVJ7QZ9gXQN9uW2KFGjeyeQ/o81lEJvfNZJmeuMVDQ4
 JHMsaLUa8RCAAoMLVKWnXMGc3VoLxGqHMFFfcrWywF7GLNiRnrWPC5j9dmtquU36BhkoKTGz6
 YfkFVga+kqF6/87sRbUNidH9KAVNULjCqOctrvd3+Lzb5I5SHEWyn1EqvXYotMNgjuOXgWymA
 wwn+JVrRwHwbH65LXQY7mslmtlJfBeYX5EzUnHvpIekfH54Z5NOjZ
Cc: Arnd Bergmann <arnd@arndb.de>, Jiri Slaby <jirislaby@kernel.org>,
 Amit Shah <amit@kernel.org>, gregkh <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, Guo Ren <guoren@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Omar Sandoval <osandov@fb.com>
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

On Fri, Aug 6, 2021 at 5:01 AM Xianting Tian
<xianting.tian@linux.alibaba.com> wrote:
> @@ -163,6 +155,13 @@ static void hvc_console_print(struct console *co, const char *b,
>         if (vtermnos[index] == -1)
>                 return;
>
> +       list_for_each_entry(hp, &hvc_structs, next)
> +               if (hp->vtermno == vtermnos[index])
> +                       break;
> +
> +       c = hp->c;
> +
> +       spin_lock_irqsave(&hp->c_lock, flags);

The loop looks like it might race against changes to the list. It seems strange
that the print function has to actually search for the structure here.

It may be better to have yet another array for the buffer pointers next to
the cons_ops[] and vtermnos[] arrays.

> +/*
> + * These sizes are most efficient for vio, because they are the
> + * native transfer size. We could make them selectable in the
> + * future to better deal with backends that want other buffer sizes.
> + */
> +#define N_OUTBUF       16
> +#define N_INBUF                16
> +
> +#define __ALIGNED__ __attribute__((__aligned__(sizeof(long))))

I think you need a higher alignment for DMA buffers, instead of sizeof(long),
I would suggest ARCH_DMA_MINALIGN.

       Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
