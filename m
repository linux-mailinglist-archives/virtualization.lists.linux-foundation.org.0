Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E090B177061
	for <lists.virtualization@lfdr.de>; Tue,  3 Mar 2020 08:49:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0B31786F21;
	Tue,  3 Mar 2020 07:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J25SyeWr+Uqj; Tue,  3 Mar 2020 07:49:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7B82486F85;
	Tue,  3 Mar 2020 07:49:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 587BCC07FF;
	Tue,  3 Mar 2020 07:49:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D059C013E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 07:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 93C9985161
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 07:49:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UIdj5yEen-1t
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 07:49:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1D2F485142
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 07:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583221781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sLrD7bEP5zhLVSAm9UAIBHNymZW6WymXSNzcXhz+dHE=;
 b=U+5FuUv8C64xh2UxG3Fis4emuXfBq0QHKg14Qzlx+6NyOmtti1rweDfrxDZQvB4MW7yYt/
 VrJ1F2joCIuF+GKg9Dl3af1Cm6Ronb6TsKv8B8nOQVO1FYdrO2bj50QR1y4/CoP9HbxYgu
 BfKN1D5tMTMHlu9DTCJZTX7T6ud62mY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-W6URLR4jMSmTNOUswYpKBw-1; Tue, 03 Mar 2020 02:49:37 -0500
X-MC-Unique: W6URLR4jMSmTNOUswYpKBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F91E801A08;
 Tue,  3 Mar 2020 07:49:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DEF25D9C9;
 Tue,  3 Mar 2020 07:49:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A9F5017449; Tue,  3 Mar 2020 08:49:34 +0100 (CET)
Date: Tue, 3 Mar 2020 08:49:34 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 09/51] drm/cirrus: Use drmm_add_final_kfree
Message-ID: <20200303074934.vlqxiye7lydnoykd@sirius.home.kraxel.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-10-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20200302222631.3861340-10-daniel.vetter@ffwll.ch>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Walleij <linus.walleij@linaro.org>
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

> @@ -575,9 +574,12 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
>  
>  	dev = &cirrus->dev;
>  	ret = drm_dev_init(dev, &cirrus_driver, &pdev->dev);
> -	if (ret)
> -		goto err_free_cirrus;
> +	if (ret) {
> +		kfree(cirrus);
> +		goto err_pci_release;
> +	}
>  	dev->dev_private = cirrus;
> +	drmm_add_final_kfree(dev, cirrus);

That doesn't look like an error path improvement.
With patch #30 applied it'll looks alot better though.
So maybe squash the patches?

In any case:
Acked-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
