Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BE808414BA9
	for <lists.virtualization@lfdr.de>; Wed, 22 Sep 2021 16:18:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 587C4613E8;
	Wed, 22 Sep 2021 14:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HvtlYxNBxlPC; Wed, 22 Sep 2021 14:18:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3A04A613E6;
	Wed, 22 Sep 2021 14:18:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5CBDC000D;
	Wed, 22 Sep 2021 14:18:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B682C000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 14:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BADA613E6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 14:18:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_aeCYaqjCr6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 14:18:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E1AF613E5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 14:18:30 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id k10so3064546vsp.12
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 07:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4PAUUUtUWlJzST2fG7TdOWPNu1FCJMhkGhRnMRQX8Oc=;
 b=W3R4JWN2xEc858sw+MVUjVvEhbWVfTboF3e+5+jetRgw3LRJzTQ8WHnO6IpXJitCcg
 yc4fS/q3o+2FQdVNavJ3uTSqs03NBsQIwTzam5kAuf7CFaLYP2v6ZnC7Nuy9oARf2Jsu
 iASYCOEpHlrP+Zv04ShlVbaXnXO73bfFlEh51gHibLI7D0sVz0Omiuek1Bhjk78NPb6y
 zlpAyhKafG9Z4OY01YuPCV4qTqK+zyanp+aWHQyXxT/aoeWdam/b/h0NFXeMLfiEl1bV
 kqxQvbXcAtPx7G6XYFFgx/sf/pbydq62NIgtEoOPUZ4XgUK+00g9GzoNmLaVYcvNwzGw
 MnOw==
X-Gm-Message-State: AOAM530uL2DACpyZtWVohWHIxIV36RwVvJg1k4n5/MgEXZPyCZb5q5Cb
 NcBuS42tyoTpe/yjfDYjnqfk+XNm9x0ANP8d9yc=
X-Google-Smtp-Source: ABdhPJz5A6+t/+J2P2icovoL2g+OWJpt4lZNgsemjl/kVjg7/1o8O6j2TksYmHj2qEDi5s1cVbmsKe1vWCZU194fgps=
X-Received: by 2002:a67:f147:: with SMTP id t7mr20253515vsm.41.1632320309397; 
 Wed, 22 Sep 2021 07:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210921215218.89844-1-michael.christie@oracle.com>
 <20210921215218.89844-3-michael.christie@oracle.com>
In-Reply-To: <20210921215218.89844-3-michael.christie@oracle.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Sep 2021 16:18:18 +0200
Message-ID: <CAMuHMdWeToGusZvg+7x_iwa9vCk3Y7ByDADw70JVZ5AZoVdR0g@mail.gmail.com>
Subject: Re: [PATCH V2 2/9] fork: pass worker_flags to copy_thread
To: Mike Christie <michael.christie@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>, hdanton@sina.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Christian Brauner <christian.brauner@ubuntu.com>
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

On Tue, Sep 21, 2021 at 11:55 PM Mike Christie
<michael.christie@oracle.com> wrote:
> We need to break up PF_IO_WORKER into the parts that are used for
> scheduling and signal handling and the part that tells copy_thread to
> treat it as a special type of thread during setup. This patch passes the
> worker_flags to copy_thread, so in the next patch we can add new worker
> flags that function can see.
>
> Signed-off-by: Mike Christie <michael.christie@oracle.com>

>  arch/m68k/kernel/process.c       | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
