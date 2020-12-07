Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E372D0D72
	for <lists.virtualization@lfdr.de>; Mon,  7 Dec 2020 10:55:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE5A9869F5;
	Mon,  7 Dec 2020 09:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id has9Cu8FG4tn; Mon,  7 Dec 2020 09:55:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 55B3E869FE;
	Mon,  7 Dec 2020 09:55:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32BCFC013B;
	Mon,  7 Dec 2020 09:55:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2B7DC013B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 09:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C33CB2D9B5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 09:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuD35XtRXFdg
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 09:55:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 67C0720029
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 09:55:01 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id z12so7056876pjn.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 07 Dec 2020 01:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c1ijwXEzq1R0G/4ZNI3/fhePYdLBTc+lajLyuEz2YUA=;
 b=uKCAswN8orDkk/9ArXT99bgGq9YbfSr2CYZlDHndf5XxHIHWtM3NBBtvCW+SjDNu8u
 XtEGLeizBhkVDpju/kSCp4aApXDkrlqPAoLtLrqpkIVc75TIxejZMgTiwUe4rxMnLnu8
 pqJx4sRyEQce9iZaeE03pjSD6jGh+4X1+FqxqYCkznJYSjSYheUS6rBI7rwKdOFw+dJr
 OS6I3VwTQkyxRHeufP9ExGOihDKn4rqrXPkmysWDkvtQNxRaL9Kfw2+6X8MSHtjc8X1w
 0p8F8ufzKvZ8FdZlFOIk+OTsoRGM7KRl+Ek7d6ZAz33PikOHJokFdA44u/qIafzzAt51
 CVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c1ijwXEzq1R0G/4ZNI3/fhePYdLBTc+lajLyuEz2YUA=;
 b=astVhdtaqNlqDidu+Y+7F7jR0nT0rHo3Wi0C6VUla7OgWqdUZ52aXKVj5G7fluSyju
 FBVzdE1xt7Yv0H7VLbn39bw0EbJoBLL31t1pJgIWQXSSv1S1BhEl50YMVPnRlpelJxjV
 eSmR6xlNQRHGIPzIEuxRiKQDET+MPCdoDymGQw9nRuQjGudNPeMb2tE3uZON0KJ+M7Ig
 932Bzp9iFJQE+Z7lDXnExocJwy/NX2CELnpNqdNSJ5vZksCLY075NoHiHf1bc/gtVs5N
 u4V9z/wFflfJPBCTqvtY4g0nW9jkBbrM/97HIfb7tfEQWVUz7vZ8FDbxkF3L3FAuvavt
 hjTA==
X-Gm-Message-State: AOAM5337xSY4xvhIgsbrnwg0eD2V9fCCBsW/TML7Tjrakf9U2Sh1HQg+
 bgRxEVL8XSeFkkieyP+HuNunaA4OeM45CpMKxXM=
X-Google-Smtp-Source: ABdhPJz/GBtiiv3mD5g76WW5o3RgzSnYQjU0y/kBGXP1kpjxGOA1HFRkaaFFh1hoKYOerS2jhHX73Xl3+YMDbw0l4EM=
X-Received: by 2002:a17:90b:a17:: with SMTP id
 gg23mr16092108pjb.129.1607334901092; 
 Mon, 07 Dec 2020 01:55:01 -0800 (PST)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net>
In-Reply-To: <20201203191135.21576-1-info@metux.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 7 Dec 2020 11:55:49 +0200
Message-ID: <CAHp75VcwJw6Dgpi2Oou6eBkL2oO1vmPUYaU5z4V3gFYTCCQ7PQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drivers: gpio: put virtual gpio device into their
 own submenu
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
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

On Thu, Dec 3, 2020 at 9:22 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Since we already have a few virtual gpio devices, and more to come,

gpio -> GPIO

> this category deserves its own submenu.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
