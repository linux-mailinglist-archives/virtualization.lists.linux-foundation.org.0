Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DB5211F56
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 10:58:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1A68A8A8B2;
	Thu,  2 Jul 2020 08:58:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AJEgO2ekAJud; Thu,  2 Jul 2020 08:58:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E38E98A8F5;
	Thu,  2 Jul 2020 08:58:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABCCDC0733;
	Thu,  2 Jul 2020 08:58:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EDF16C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 08:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CFAC32530B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 08:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xsa8dsSY6rOs
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 08:58:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by silver.osuosl.org (Postfix) with ESMTPS id A0D6425379
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 08:58:34 +0000 (UTC)
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N1gac-1ip1ot3sk4-01213E for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Jul 2020 10:58:32 +0200
Received: by mail-qt1-f169.google.com with SMTP id e12so20614476qtr.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Jul 2020 01:58:31 -0700 (PDT)
X-Gm-Message-State: AOAM533lxECGT5swBb+PojGVPUrNP2BfWhoyq9xnQykvK9HvnHuBk4Sa
 YXppkqm798Vl3WtgJTmXxDgrJW1Jhq9G3W6cWBc=
X-Google-Smtp-Source: ABdhPJwmVhcWIjW9naHQ+EtJIo8qem6eHT7ix06ZnfalWEEgAsXZpi1xlLnmHrPnhvrb+Fee92Gc5bSzX/y8gl2q00Y=
X-Received: by 2002:ac8:33d7:: with SMTP id d23mr30244902qtb.204.1593680310449; 
 Thu, 02 Jul 2020 01:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200701200950.30314-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20200701200950.30314-1-rikard.falkeborn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 2 Jul 2020 10:58:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0iVY54EMWYDLdn3QoqmO0CkZMJk-P2G19epm8FCTX8bg@mail.gmail.com>
Message-ID: <CAK8P3a0iVY54EMWYDLdn3QoqmO0CkZMJk-P2G19epm8FCTX8bg@mail.gmail.com>
Subject: Re: [PATCH 0/5] drivers/char: Constify static variables
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
X-Provags-ID: V03:K1:oSZPUYuv5BnSGDE7XXz3NQ9Xa2vnHxw7ZxaDaukP2Fi4xgeIgKH
 YSkpnWzBHzxi0vP8Qh3UA49UVqaj7d7eG0l2DsjhNVNQYUJnsZley1X9ZvbetzFcgOgEZ8h
 oTJII/NWNi4gZzNvddvDRyvRMpeCPJH0jNmqTyPX3WZEQs+fK9ytArrn7TITEUEd/lVHjqz
 skZpS9zzH05EtqXOdM6fw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GS/L6Vws/tw=:KfFldzC+iQqOuJXHu19Zf/
 t27b0luJPMU6JuTwoXWFZZN45Y1T8pEWf+W+rEALWyu0jg74c76Wyiu9srFabNvdL+jrIHJVI
 0+d+R1oxrYNTqiJwCRAc7zBjLPhRNz2lPNGWF/VVtlAz6Gp73hUXF1b3+rsBUGYAzga0bomM5
 go0alynYn8bcV8IVXKRXfHwYnYtlFWs9jyZowqC801TnbhrZXsI9OEIYzLkCJJ5zWZBTIbu2z
 vPSp5N+t9SO7WiTbkdpdtz422mccRI+m4whqNBXcQtr1rXznFvKZWECsaQar9O5Cq41eQoMlB
 eb2esTSe15PEuiO/Rh6PDiohrO+BCXqcs49O4sP3D2QaATk+AfkKslwT5QXYmAcjtd/6uAXIN
 qvOJG+Jo6mTFewqh3u2jfL/OLWq/KP6nEZralcyXOIStZfxzwkYO6VE2TT6tZFavIfon+24K6
 rhvtzSse/I/cFN4p32Pahl31213JApEHXstb6zUtc9jwstN7cJISqVgUExu0HbmvtQNAogbBB
 R8igVn+Av8+/NFk6TkaSAbStTf9Fxv6mrtl0zjSWq5LqaXTWYGqkUr3kCSQ7nU+dx1YNS5SRV
 MTjZnpvxlmqGga6ZRf20p7tcCWGEiGwXjISne41R3KlKAKZbJoWCZTfPhcH17PQwLxu4b0jaF
 vWb2DRuea4pNWz7Na1Ayr6zhGLWWGyeNjLQf/nNJj2ROVN8d1BWbTlmTYnnZ1j+YlfNmevTlq
 YlrA09vYaiGz7P3Eqlzy+3flQRZHMuqu4tqR+sJvq6Rdjtm1O08iBdLsDjHoT5eK9s0kKM75+
 UrM7I6jlrPTCNBmrfz/wBbNJf/2NgybIPq84oW5DbALxfN4ZYk=
Cc: Corey Minyard <minyard@acm.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Scott Branden <sbranden@broadcom.com>, Amit Shah <amit@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ray Jui <rjui@broadcom.com>, virtualization@lists.linux-foundation.org,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, Matt Mackall <mpm@selenic.com>,
 openipmi-developer@lists.sourceforge.net,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>
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

On Wed, Jul 1, 2020 at 11:48 PM Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:
>
> Constify some static variables (mostly structs) that are not modified.
>
> Rikard Falkeborn (5):
>   hwrng: bcm2835 - Constify bcm2835_rng_devtype[]
>   hwrng: nomadik - Constify nmk_rng_ids[]
>   hwrng: virtio - Constify id_table[]
>   ipmi: watchdog: Constify ident
>   virtio_console: Constify some static variables

I just realized it was a series rather than a single patch I received. They
all look correct, so

Acked-by: Arnd Bergmann <arnd@arndb.de>

but if you do more of those, I would suggest not including the 'size'
output for the small variables as that is not the main point here.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
