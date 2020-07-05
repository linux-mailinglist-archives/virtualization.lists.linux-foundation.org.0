Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 94241214E9E
	for <lists.virtualization@lfdr.de>; Sun,  5 Jul 2020 20:47:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 43A7D87381;
	Sun,  5 Jul 2020 18:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E96cQafGsnAe; Sun,  5 Jul 2020 18:47:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 087D887379;
	Sun,  5 Jul 2020 18:47:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC354C08A9;
	Sun,  5 Jul 2020 18:47:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F965C016F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jul 2020 18:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 15EE488B0B
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jul 2020 18:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnCd31EWTS3R
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jul 2020 18:47:53 +0000 (UTC)
X-Greylist: delayed 00:15:49 by SQLgrey-1.7.6
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A3E4988ADA
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jul 2020 18:47:52 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 954D43AFA8D
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jul 2020 18:30:46 +0000 (UTC)
X-Originating-IP: 212.92.121.187
Received: from localhost (unknown [212.92.121.187])
 (Authenticated sender: amit@amitshah.net)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B06631BF20A;
 Sun,  5 Jul 2020 18:30:39 +0000 (UTC)
Date: Sun, 5 Jul 2020 20:30:38 +0200
From: Amit Shah <amitshah@gmx.net>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH 5/5] virtio_console: Constify some static variables
Message-ID: <20200703175529.GE3150@trundl.on>
References: <20200701200950.30314-1-rikard.falkeborn@gmail.com>
 <20200701200950.30314-6-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701200950.30314-6-rikard.falkeborn@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 virtualization@lists.linux-foundation.org
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

On (Wed) 01 Jul 2020 [22:09:50], Rikard Falkeborn wrote:
> The id_table and feature_table pointers in struct virtio_driver are
> pointers to const. Mark the corresponding static variables const to
> allow the compiler to put them in read-only memory.
> 
> Before:
>    text    data     bss     dec     hex filename
>   25447     713      76   26236    667c drivers/char/virtio_console.o
> 
> After:
>    text    data     bss     dec     hex filename
>   25488     673      76   26237    667d drivers/char/virtio_console.o
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Reviewed-by: Amit Shah <amit@kernel.org>

Please CC me on the entire series instead of individual patches in the
future.

Thanks,

		Amit
-- 
http://amitshah.net/
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
