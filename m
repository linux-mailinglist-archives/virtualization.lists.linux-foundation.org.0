Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C28C31D7C3
	for <lists.virtualization@lfdr.de>; Wed, 17 Feb 2021 11:59:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C925E85FC1;
	Wed, 17 Feb 2021 10:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9szHDAcUtzR; Wed, 17 Feb 2021 10:58:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3E8538531D;
	Wed, 17 Feb 2021 10:58:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11E16C013A;
	Wed, 17 Feb 2021 10:58:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B94AFC013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 10:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A19DC8632F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 10:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bWMkVmKqaSOv
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 10:58:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EC4A2862E1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 10:58:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1CE564DEC;
 Wed, 17 Feb 2021 10:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1613559536;
 bh=b1b/aNaoVehd5YPjG+c6xbLEqKnKrrXS6HoGjYZe5Ck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uky563pW9e8RQtoRpAWXFlqKR3UhAjzIZfuIc5knaxuGTv9lgeRCupHmMGaRo4kHa
 mtrhDvR/MPMJCK1BQwjxPzV1HktYglF39bX1G5SC4qpe/h8Bj2b5vHaJSv54WE427M
 oBSysl+d5SMV8U0cL9oQpJhFEiSrfQlZnwm13C5I=
Date: Wed, 17 Feb 2021 11:58:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH for 5.10 v2 0/5] vdpa_sim: fix param validation in
 vdpasim_get_config()
Message-ID: <YCz27cywSabiGgDz@kroah.com>
References: <20210216142439.258713-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210216142439.258713-1-sgarzare@redhat.com>
Cc: virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
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

On Tue, Feb 16, 2021 at 03:24:34PM +0100, Stefano Garzarella wrote:
> v1: https://lore.kernel.org/stable/20210211162519.215418-1-sgarzare@redhat.com/
> 
> v2:
> - backport the upstream patch and related patches needed
> 
> Commit 65b709586e22 ("vdpa_sim: add get_config callback in
> vdpasim_dev_attr") unintentionally solved an issue in vdpasim_get_config()
> upstream while refactoring vdpa_sim.c to support multiple devices.
> 
> Before that patch, if 'offset + len' was equal to
> sizeof(struct virtio_net_config), the entire buffer wasn't filled,
> returning incorrect values to the caller.
> 
> Since 'vdpasim->config' type is 'struct virtio_net_config', we can
> safely copy its content under this condition.
> 
> The minimum set of patches to backport the patch that fixes the issue, is the
> following:
> 
>    423248d60d2b vdpa_sim: remove hard-coded virtq count
>    6c6e28fe4579 vdpa_sim: add struct vdpasim_dev_attr for device attributes
>    cf1a3b35382c vdpa_sim: store parsed MAC address in a buffer
>    f37cbbc65178 vdpa_sim: make 'config' generic and usable for any device type
>    65b709586e22 vdpa_sim: add get_config callback in vdpasim_dev_attr
> 
> The patches apply fairly cleanly. There are a few contextual differences
> due to the lack of the other patches:
> 
>    $ git backport-diff -u master -r linux-5.10.y..HEAD

Cool, where is 'backport-diff' from?

>    Key:
>    [----] : patches are identical
>    [####] : number of functional differences between upstream/downstream patch
>    [down] : patch is downstream-only
>    The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> 
>    001/5:[----] [--] 'vdpa_sim: remove hard-coded virtq count'
>    002/5:[----] [-C] 'vdpa_sim: add struct vdpasim_dev_attr for device attributes'
>    003/5:[----] [--] 'vdpa_sim: store parsed MAC address in a buffer'
>    004/5:[----] [-C] 'vdpa_sim: make 'config' generic and usable for any device type'
>    005/5:[----] [-C] 'vdpa_sim: add get_config callback in vdpasim_dev_attr'

Now all applied, thanks.

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
