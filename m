Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8B530DCA9
	for <lists.virtualization@lfdr.de>; Wed,  3 Feb 2021 15:25:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 09B2887113;
	Wed,  3 Feb 2021 14:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W5vkbwlMD7TO; Wed,  3 Feb 2021 14:25:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A336D870BD;
	Wed,  3 Feb 2021 14:25:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78CA6C0FA7;
	Wed,  3 Feb 2021 14:25:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B75BC013A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 14:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 155D586927
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 14:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L4tRoY8T+Uyv
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 14:25:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 62F4A868F1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 14:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612362324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OxfTFr0q8Tf9h3gAFIf04FpqXe2AG8QXR8Ik/VWm3BI=;
 b=hetCHUn52rkt9xojH+nnvcw9E5N27snlHmqe+G6vfxVKMhU2Uhpw28DB7EPi6kXpExPPPs
 2vnZjktdWAxKlVWfMKqxfF4lcNTauLJQOoYOa71wSijtz6Zko8tfIVwG+iMig8lR6sc2xd
 RLJfW9TFImqF7g2Q5UQkBJHycqAMZ1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-o1In-4mkPJKDqZcQ64ryKg-1; Wed, 03 Feb 2021 09:25:22 -0500
X-MC-Unique: o1In-4mkPJKDqZcQ64ryKg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C661196632D;
 Wed,  3 Feb 2021 14:25:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7FE95B692;
 Wed,  3 Feb 2021 14:25:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0A44A1800853; Wed,  3 Feb 2021 15:25:16 +0100 (CET)
Date: Wed, 3 Feb 2021 15:25:16 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH V2] virtio_input: Prevent EV_MSC/MSC_TIMESTAMP loop storm
 for MT.
Message-ID: <20210203142516.uzinnnkngahqfhdn@sirius.home.kraxel.org>
References: <20210202001923.6227-1-colin.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202001923.6227-1-colin.xu@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 mst@redhat.com
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

  Hi,

> +	/*
> +	 * Since 29cc309d8bf1 (HID: hid-multitouch: forward MSC_TIMESTAMP),
> +	 * EV_MSC/MSC_TIMESTAMP is added to each before EV_SYN event.
> +	 * EV_MSC is configured as INPUT_PASS_TO_ALL.
> +	 * In case of touch device:
> +	 *   BE pass EV_MSC/MSC_TIMESTAMP to FE on receiving event from evdev.
> +	 *   FE pass EV_MSC/MSC_TIMESTAMP back to BE.
> +	 *   BE writes EV_MSC/MSC_TIMESTAMP to evdev due to INPUT_PASS_TO_ALL.
> +	 *   BE receives extra EV_MSC/MSC_TIMESTAMP and pass to FE.
> +	 *   >>> Each new frame becomes larger and larger.
> +	 * Disable EV_MSC/MSC_TIMESTAMP forwarding for MT.
> +	 */
> +	if (vi->idev->mt && type == EV_MSC && code == MSC_TIMESTAMP)
> +		return 0;
> +

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
