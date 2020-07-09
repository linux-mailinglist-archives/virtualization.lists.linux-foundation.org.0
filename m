Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E57821A0E1
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 15:29:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AD300204FE;
	Thu,  9 Jul 2020 13:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1wNaEABKLL8r; Thu,  9 Jul 2020 13:29:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 09C22204A9;
	Thu,  9 Jul 2020 13:29:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8BE9C016F;
	Thu,  9 Jul 2020 13:29:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FC0DC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 13:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 776D888389
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 13:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2LCvMYNFU+dH
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 13:29:37 +0000 (UTC)
X-Greylist: delayed 00:33:55 by SQLgrey-1.7.6
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 525E787CC4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 13:29:37 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1jtW4d-0003xv-Ke; Thu, 09 Jul 2020 22:54:48 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 09 Jul 2020 22:54:47 +1000
Date: Thu, 9 Jul 2020 22:54:47 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH 0/5] drivers/char: Constify static variables
Message-ID: <20200709125447.GD31057@gondor.apana.org.au>
References: <20200701200950.30314-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701200950.30314-1-rikard.falkeborn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Corey Minyard <minyard@acm.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Arnd Bergmann <arnd@arndb.de>,
 Amit Shah <amit@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, virtualization@lists.linux-foundation.org,
 bcm-kernel-feedback-list@broadcom.com, linux-crypto@vger.kernel.org,
 Matt Mackall <mpm@selenic.com>, openipmi-developer@lists.sourceforge.net,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
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

On Wed, Jul 01, 2020 at 10:09:45PM +0200, Rikard Falkeborn wrote:
> Constify some static variables (mostly structs) that are not modified.
> 
> Rikard Falkeborn (5):
>   hwrng: bcm2835 - Constify bcm2835_rng_devtype[]
>   hwrng: nomadik - Constify nmk_rng_ids[]
>   hwrng: virtio - Constify id_table[]
>   ipmi: watchdog: Constify ident
>   virtio_console: Constify some static variables
> 
>  drivers/char/hw_random/bcm2835-rng.c | 2 +-
>  drivers/char/hw_random/nomadik-rng.c | 2 +-
>  drivers/char/hw_random/virtio-rng.c  | 2 +-
>  drivers/char/ipmi/ipmi_watchdog.c    | 2 +-
>  drivers/char/virtio_console.c        | 8 ++++----
>  5 files changed, 8 insertions(+), 8 deletions(-)

Patches 1-3 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
