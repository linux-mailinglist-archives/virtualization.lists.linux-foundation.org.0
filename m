Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF78312FAB
	for <lists.virtualization@lfdr.de>; Mon,  8 Feb 2021 11:54:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4127285D35;
	Mon,  8 Feb 2021 10:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a-Y2jNZijzMN; Mon,  8 Feb 2021 10:54:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE7CF85D11;
	Mon,  8 Feb 2021 10:54:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A56C6C013A;
	Mon,  8 Feb 2021 10:54:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFB81C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 10:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CDE3886235
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 10:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBSj-jTShcfV
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 10:54:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2B673860A3
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 10:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612781638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQVbdOsEZJXaBu6WmqIHG/d67j0agxNgNmLPFRLrqY8=;
 b=JBCspTQOsbqmLgT2xBxKAVLp8Yh2YHDJLNlvQjUHcbwvoyGF+uVGi5aQ6CuFi5+X6PY/U8
 TxH5oGhTXCrQ/O+54jyo+RE7B7HYAKa0h6onm5gpWK/0T3suAQcG0iqU9qYWhA+r512LiS
 irt81zpDABqZFe+eU29Q6d57XOm/JhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-ZnCfFjIEOueUOJ1oojTEqw-1; Mon, 08 Feb 2021 05:53:57 -0500
X-MC-Unique: ZnCfFjIEOueUOJ1oojTEqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85D65CC62B;
 Mon,  8 Feb 2021 10:53:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-170.ams2.redhat.com
 [10.36.112.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05BAB5D9DD;
 Mon,  8 Feb 2021 10:53:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F28A91800D5D; Mon,  8 Feb 2021 11:53:52 +0100 (CET)
Date: Mon, 8 Feb 2021 11:53:52 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/6] drm: Move vmap out of commit tail for SHMEM-based
 drivers
Message-ID: <20210208105352.6mw7w6hlefrer5al@sirius.home.kraxel.org>
References: <20210204200308.24216-1-tzimmermann@suse.de>
 <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>
 <88b6a41d-d457-6675-4692-c2dc773c9a2d@suse.de>
MIME-Version: 1.0
In-Reply-To: <88b6a41d-d457-6675-4692-c2dc773c9a2d@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 sean@poorly.run
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

On Sun, Feb 07, 2021 at 07:33:24PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.02.21 um 10:05 schrieb Gerd Hoffmann:
> >    Hi,
> > 
> > > I smoke-tested the code by running fbdev, Xorg and weston with the
> > > converted mgag200 driver.
> > 
> > Looks sane to me.
> > Survived cirrus smoke test too.
> > 
> > Tested-by: Gerd Hoffmann <kraxel@redhat.com>
> > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> I had to add one additional patch to v2 of this patchset to make things work
> with module-only builds. If you have a minute, could you ack this as well?
> Thanks!

Works fine too.

take care,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
