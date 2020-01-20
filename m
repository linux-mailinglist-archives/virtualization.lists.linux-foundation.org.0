Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C371427B7
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 10:59:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BCE5D20000;
	Mon, 20 Jan 2020 09:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3UljDn8Cbc4; Mon, 20 Jan 2020 09:59:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0B94D20419;
	Mon, 20 Jan 2020 09:59:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D84DAC0174;
	Mon, 20 Jan 2020 09:59:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C241DC0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 09:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AB031816F3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 09:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tryemAtMp0zp
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 09:58:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BBD5484D3B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 09:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579514332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p4eK6vXKj+U4Gyw4hOMEglBV2hs+OR/eN9lPxkWj/qk=;
 b=MpxzOj9HJx2N60E8f5aELRsRsc4x9Ezxk2vjf12Qf3F4HwMGodBFbWtJtE4m8f1l5J30XS
 dfLUrLINNT15KMSAdYFtVxEGFh9y8ryrz2Rsx3XYImTfsBzjiVVBuKnyoRpyNC/HM1j0aw
 Q76yELULThD59l0Pmromuzevncqn9NI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-xRdfPQNnMkm7NL3zhBnxJg-1; Mon, 20 Jan 2020 04:58:51 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECDBADB8F;
 Mon, 20 Jan 2020 09:58:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A92CA8BE2C;
 Mon, 20 Jan 2020 09:58:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DFA9016E36; Mon, 20 Jan 2020 10:58:48 +0100 (CET)
Date: Mon, 20 Jan 2020 10:58:48 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: bochs_hw_init fails to request framebuffer on EFI boot with
 plymouth visible
Message-ID: <20200120095848.hg4ywvocf5bcdun5@sirius.home.kraxel.org>
References: <20200113071939.rtqb7yw45zi63fqy@sirius.home.kraxel.org>
 <20200115003356.GL2507@mail-itl>
 <20200115100821.qcdraolkoki6e5tz@sirius.home.kraxel.org>
 <20200115134119.GP1314@mail-itl>
 <20200115141353.3kse3uj2mg6ik6k5@sirius.home.kraxel.org>
 <20200115142741.GM2507@mail-itl>
 <20200115161635.ekrnk5rmjqbxxu77@sirius.home.kraxel.org>
 <20200116025232.GN2507@mail-itl>
 <20200117125825.3in2t2m6nxbblsaf@sirius.home.kraxel.org>
 <20200117152211.GZ1314@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20200117152211.GZ1314@mail-itl>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: xRdfPQNnMkm7NL3zhBnxJg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Fri, Jan 17, 2020 at 04:22:11PM +0100, Marek Marczykowski-G=F3recki wrot=
e:
> On Fri, Jan 17, 2020 at 01:58:25PM +0100, Gerd Hoffmann wrote:
> > > Should switching to bochsdrmfb be deferred until efifb gets properly
> > > destroyed? How?
> > =

> > Should be in do_remove_conflicting_framebuffers, everyone might run into
> > this.  So lets try wait for all (other) references went away:
> =

> Yes, this solves the problem. I guess the proper solution would be to
> replace it with some wait queue or such, right?

Not sure a wait queue would actually be better.

> Is there any guarantee that the process holding /dev/fb0 (plymouthd in
> this case) will eventually release it?

No.

So it'll probably makes sense to limit the time we are willing to wait
here.

Or maybe take a completely different path and make the reservation
failure in bochs-drm a warning not an error.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
