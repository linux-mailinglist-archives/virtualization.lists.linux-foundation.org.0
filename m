Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCAF276E74
	for <lists.virtualization@lfdr.de>; Thu, 24 Sep 2020 12:17:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4F5202E0F7;
	Thu, 24 Sep 2020 10:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SU2i0T+0T8gA; Thu, 24 Sep 2020 10:17:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2C80923018;
	Thu, 24 Sep 2020 10:17:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1714FC0051;
	Thu, 24 Sep 2020 10:17:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65166C0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 10:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 53F1787490
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 10:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VlE8LX6ZU5aU
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 10:17:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A53688748F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 10:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600942653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ORL76fhl426t9LBfvBEBRXRu6hVyw1ffJIy0ygUo/8M=;
 b=ZD9dkHb20Kyk0eyFqncyHHXML1JExs9d0TwFYpcPnw6oH9FSemJfN2/fH/wMd8pP8g7TZ/
 PEWQaZ+I1Nb8x+NAxgPRLSdWLE3SgqZaB4NZ6tt1xO0wy5gxPJ9RW571Oe9juPAO8i/EbD
 GyetF+wCBPyE62mzbcNxZxEb8rO05dA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-HUuXQv_VMmKI01zE3R3vfA-1; Thu, 24 Sep 2020 06:17:29 -0400
X-MC-Unique: HUuXQv_VMmKI01zE3R3vfA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B158107465D;
 Thu, 24 Sep 2020 10:17:28 +0000 (UTC)
Received: from localhost (ovpn-114-133.ams2.redhat.com [10.36.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95B065D990;
 Thu, 24 Sep 2020 10:17:21 +0000 (UTC)
Date: Thu, 24 Sep 2020 11:17:20 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH 00/24] Control VQ support in vDPA
Message-ID: <20200924101720.GR62770@stefanha-x1.localdomain>
References: <20200924032125.18619-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200924032125.18619-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: lulu@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, mhabets@solarflare.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, eli@mellanox.com, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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
Content-Type: multipart/mixed; boundary="===============5473650913561324527=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============5473650913561324527==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sxhug0Teuf3tiWmo"
Content-Disposition: inline

--sxhug0Teuf3tiWmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 24, 2020 at 11:21:01AM +0800, Jason Wang wrote:
> This series tries to add the support for control virtqueue in vDPA.

Please include documentation for both driver authors and vhost-vdpa
ioctl users. vhost-vdpa ioctls are only documented with a single
sentence. Please add full information on arguments, return values, and a
high-level explanation of the feature (like this cover letter) to
introduce the API.

What is the policy for using virtqueue groups? My guess is:
1. virtio_vdpa simply enables all virtqueue groups.
2. vhost_vdpa relies on userspace policy on how to use virtqueue groups.
   Are the semantics of virtqueue groups documented somewhere so
   userspace knows what to do? If a vDPA driver author decides to create
   N virtqueue groups, N/2 virtqueue groups, or just 1 virtqueue group,
   how will userspace know what to do?

Maybe a document is needed to describe the recommended device-specific
virtqueue groups that vDPA drivers should implement (e.g. "put the net
control vq into its own virtqueue group")?

This could become messy with guidelines. For example, drivers might be
shipped that aren't usable for certain use cases just because the author
didn't know that a certain virtqueue grouping is advantageous.

BTW I like how general this feature is. It seems to allow vDPA devices
to be split into sub-devices for further passthrough. Who will write the
first vDPA-on-vDPA driver? :)

Stefan

--sxhug0Teuf3tiWmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9scjAACgkQnKSrs4Gr
c8g9gAgAsbQIA1ltN83b43L8ktGIqTkaBbgUY8qGUDhwkNGWmCp359eeVlWQpt4P
BtPsvuYFXv1eo5/EhiiWzKFZdP/q9pZ0I+BKvMtJ5kZ24KHVSG81nA+lrteSa4Xi
uNX5DZFX+D9QRJwSuH+IPW5Q9tVP40nkZm6wqE7NYmM2UDspkchA+Jn9+ekdfcXv
O3OEP7kgYb9Rv3OyRJ5lHzETfE8VBd45xm5G9QuiojYmBnS5b5jJGKcHyr7sc4I6
547J/3Xq9Hrp/JwivlmcHdPyQgTn4Xz/tzcpDUBa/KdF7J4v0djKtX3JSxMU3jGI
9lOAiZipWprTMyNjT6fuZpiuqHcniA==
=8jGt
-----END PGP SIGNATURE-----

--sxhug0Teuf3tiWmo--


--===============5473650913561324527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5473650913561324527==--

