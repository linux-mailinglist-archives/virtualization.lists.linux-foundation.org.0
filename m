Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A511557C8
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 13:31:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6471A86C24;
	Fri,  7 Feb 2020 12:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5DVCxERTHw4; Fri,  7 Feb 2020 12:31:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2A3C786C1A;
	Fri,  7 Feb 2020 12:31:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F1C9C1D81;
	Fri,  7 Feb 2020 12:31:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34FDEC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1F0A38651A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XktLU9dO5adJ
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:31:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8A78386493
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581078711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q9lXdQ+dbrzriB+PiEVpJGapuHhSNoaV/b+eGzzUUk4=;
 b=AqIdqZk8szn/ZqW9VNxp6q7Coqn/7l4hyAlaUSvArHU/S3q3puVMuen5WeqCk2W2pTLNWA
 s3xdYaVhLg1NxLDy0GgMqvYH9JmjdYcvhYaloVZlWvOPsMY1CzU0p83HJsc3bpT4wXnp4G
 mJU2HDN4SzcAi83V4hq15D4QcbbjJz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-My83CBNIOP2eZaExU9r_Tg-1; Fri, 07 Feb 2020 07:31:47 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D439184AEBE;
 Fri,  7 Feb 2020 12:31:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21DED7FB60;
 Fri,  7 Feb 2020 12:31:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2FA08A1E0; Fri,  7 Feb 2020 13:31:43 +0100 (CET)
Date: Fri, 7 Feb 2020 13:31:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/6] drm: Add drm_simple_encoder_{init,create}()
Message-ID: <20200207123143.y3m3moillue6udo6@sirius.home.kraxel.org>
References: <20200207084135.4524-1-tzimmermann@suse.de>
 <20200207084135.4524-3-tzimmermann@suse.de>
 <20200207103333.rxebukm4hukavlq5@sirius.home.kraxel.org>
 <cd78b79f-ff4e-9c8e-4d87-ce717a717559@suse.de>
MIME-Version: 1.0
In-Reply-To: <cd78b79f-ff4e-9c8e-4d87-ce717a717559@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: My83CBNIOP2eZaExU9r_Tg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 virtualization@lists.linux-foundation.org, noralf@tronnes.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, alexander.deucher@amd.com,
 spice-devel@lists.freedesktop.org, sam@ravnborg.org,
 emil.velikov@collabora.com
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

> > How about using
> > 
> > #define drm_simple_encoder_init(dev, type, name, ...) \
> >         drm_encoder_init(dev, drm_simple_encoder_funcs_cleanup, type, name, __VA_ARGS__)
> > 
> > instead ?

> I guess you want to save a few lines in the implementation of
> drm_simple_encoder_init() (?) If so, I'd rather try to share more
> internal code among the various init and create functions.

Yes.  You have the namestr stuff duplicated in all functions, and with
a #define that goes away.

But maybe that can be simply be dropped?  The drivers with a simple
encoder seem to not care much about the name and just pass NULL ...

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
