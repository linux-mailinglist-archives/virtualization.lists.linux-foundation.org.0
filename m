Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7D813C8FC
	for <lists.virtualization@lfdr.de>; Wed, 15 Jan 2020 17:16:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8DB56863DE;
	Wed, 15 Jan 2020 16:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kqmd1JJHfiHS; Wed, 15 Jan 2020 16:16:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EDFCE862A0;
	Wed, 15 Jan 2020 16:16:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9522C077D;
	Wed, 15 Jan 2020 16:16:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CEC9AC077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 16:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B836884C13
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 16:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTJg8FWlA7WX
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 16:16:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DB1C984ECD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579104999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dwr+N/8cEpLEehJeX2kTseEDFbYCHUJxZrM2pN4g5/w=;
 b=GPAdIwhI0sjd1Iyaak6Ddy/1+DzDwtn6hdmD4SGq91wdPunQ5np49yd6g9mLW9NxhuYMyV
 FIDeY8eNBsbvqnyS7JGaO3JurfAa9tnASGHm3H53tnD3xqeijbceM9AqY5fFlQbZeuy7lL
 IvEy0OSxy6KiLen6S89w4LJ3ufccRsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-_X6u9EWQPveP1NbgG51E6w-1; Wed, 15 Jan 2020 11:16:38 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E28B2193B7EB;
 Wed, 15 Jan 2020 16:16:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D8DC108132E;
 Wed, 15 Jan 2020 16:16:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D3CF99DA5; Wed, 15 Jan 2020 17:16:35 +0100 (CET)
Date: Wed, 15 Jan 2020 17:16:35 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: bochs_hw_init fails to request framebuffer on EFI boot with
 plymouth visible
Message-ID: <20200115161635.ekrnk5rmjqbxxu77@sirius.home.kraxel.org>
References: <20200110163211.GB29736@mail-itl>
 <20200113071939.rtqb7yw45zi63fqy@sirius.home.kraxel.org>
 <20200115003356.GL2507@mail-itl>
 <20200115100821.qcdraolkoki6e5tz@sirius.home.kraxel.org>
 <20200115134119.GP1314@mail-itl>
 <20200115141353.3kse3uj2mg6ik6k5@sirius.home.kraxel.org>
 <20200115142741.GM2507@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20200115142741.GM2507@mail-itl>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: _X6u9EWQPveP1NbgG51E6w-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, Jan 15, 2020 at 03:27:41PM +0100, Marek Marczykowski-G=F3recki wrot=
e:
> On Wed, Jan 15, 2020 at 03:13:53PM +0100, Gerd Hoffmann wrote:
> >   Hi,
> > =

> > > > And "grep -A1 0000:00:02.0 /proc/iomem" ?
> > > =

> > >   c0000000-c0ffffff : 0000:00:02.0
> > >   c1000000-c103ffff : 0000:00:04.0
> > =

> > So no reservation left.  Whatever blocked the pci bar resource (efifb
> > probably) is gone now.
> > =

> > So the interesting question is why that reservation sticked long enough
> > to prevent bochs-drm from initializing.  In theory efifb de-init should
> > be completed when drm_fb_helper_remove_conflicting_pci_framebuffers()
> > returns.
> =

> Maybe the fact that switching to text mode plymouth help, gives some
> hint?

Maybe plymouth having a /dev/fb0 file handle open in gfx mode has
something to do with it.  But if that is the case I should be able to
reproduce it in theory.  Which is not the case though ...

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
