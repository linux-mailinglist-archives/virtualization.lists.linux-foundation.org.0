Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E402D24E7
	for <lists.virtualization@lfdr.de>; Tue,  8 Dec 2020 08:49:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A8A898616A;
	Tue,  8 Dec 2020 07:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Ez3suSZ2kWt; Tue,  8 Dec 2020 07:49:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2D010860D1;
	Tue,  8 Dec 2020 07:49:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00DB4C013B;
	Tue,  8 Dec 2020 07:49:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C3D0C013B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 07:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 733508616A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 07:49:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TzhquiWZHfaq
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 07:49:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A661C860D1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 07:49:24 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id m19so23235846ejj.11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 07 Dec 2020 23:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4rL1+j26gkB7erofiOGo8PnZet2HWoJP4KemX2vffbo=;
 b=EDZMPhB73I4Mii/KMuvj6gb1rjF6rQhkVObEQc/NoDsHeQZTSxwA2e/GP7Pnvb3I+A
 si3AFq87uNTZi5nfPLxcC5rpMAajc3QRFs5InP8m5fUEso0JIWK8DDjes8rRetBU2CWe
 LB1adPwqtLY5XkmAnu+Zq+TK4HNLClKKtDUiPbwrB2SJnih9h+h0y1kDdis7Y0YiJBGC
 XevX7TfA0Smdinf8Dgxp08b/QEYj/wbTh+Ug3CZSOoNDBsc++XkF56aEDLqr4zpVQZYG
 O+YI9vFRSbhaqQ3YOoh7Dkvb/YUlARxRcbn3Rv+50G2rKgxOxrePJFkOiE5MPzTpIuRb
 idRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4rL1+j26gkB7erofiOGo8PnZet2HWoJP4KemX2vffbo=;
 b=OC+tOxFXDpCP5vvyDKoQoAW71IYG/2pLMIeZML7kdPyKxFqDzNhvOMReXOMw1bnFCv
 V2K++RG/mMqaNTtW0ci0eFOuKfhYcAlC1iv4+Wm6B15YQmF2NTWBXE7HOUV/EFNdZ2WQ
 KFk/FqRlN2n2J/diqOuMfQPL7nsZgmTXkkVBvfENV3Qg+c7+2hv6sx+D31VIg/Qs/Xrg
 Ty9K5BNHLQulGmPVQ5TAbkw16i1RUxJ567jZmHQOc+T+RW+ciQ+UIviGzsmy7tKQTZIT
 QO2CC/b0J9NORoi2wHXoNld6StX+pX8jTY5LZuR3gRhKKc3sDiOUfhVUxF8EyI9EIwby
 eL7Q==
X-Gm-Message-State: AOAM531sH2nz5Kzv0wCzdWqs3HPntwEP/74XvzC7cg4AP6PKc8vpoE/I
 iv/rc0bctR1yx/PGGXiavRo=
X-Google-Smtp-Source: ABdhPJxV3CSSLGGO1bLrsbPIe+eLOQhH8ex4ooVemMOpVQnhueMjPvGB0QMQd8PYfPB4UtiMSuYLTw==
X-Received: by 2002:a17:906:144e:: with SMTP id
 q14mr11118182ejc.150.1607413763062; 
 Mon, 07 Dec 2020 23:49:23 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id i2sm16262086edk.93.2020.12.07.23.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 23:49:21 -0800 (PST)
Date: Tue, 8 Dec 2020 07:49:20 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 10/27] vhost: Allocate shadow vring
Message-ID: <20201208074920.GQ203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-11-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201120185105.279030-11-eperezma@redhat.com>
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Lee Ballard <ballle98@gmail.com>,
 Lars Ganrot <lars.ganrot@gmail.com>, Rob Miller <rob.miller@broadcom.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3743855145172989205=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============3743855145172989205==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="90KBcPA0h13nTGdQ"
Content-Disposition: inline


--90KBcPA0h13nTGdQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:50:48PM +0100, Eugenio P=E9rez wrote:
> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-sw-lm-ring.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/virtio/vhost-sw-lm-ring.c b/hw/virtio/vhost-sw-lm-ring.c
> index cbf53965cd..cd7b5ba772 100644
> --- a/hw/virtio/vhost-sw-lm-ring.c
> +++ b/hw/virtio/vhost-sw-lm-ring.c
> @@ -16,8 +16,11 @@
>  #include "qemu/event_notifier.h"
> =20
>  typedef struct VhostShadowVirtqueue {
> +    struct vring vring;
>      EventNotifier hdev_notifier;
>      VirtQueue *vq;
> +
> +    vring_desc_t descs[];
>  } VhostShadowVirtqueue;

VhostShadowVirtqueue is starting to look like VirtQueue. Can the shadow
vq code simply use the VirtIODevice's VirtQueues instead of duplicating
this?

What I mean is:

1. Disable the vhost hdev vq and sync the avail index back to the
   VirtQueue.
2. Move the irq fd to the VirtQueue as its guest notifier.
3. Install the shadow_vq_handler() as the VirtQueue's handle_output
   function.
4. Move the call fd to the VirtQueue as its host notifier.

Now we can process requests from the VirtIODevice's VirtQueue using
virtqueue_pop() and friends. We're also in sync and ready for vmstate
save/load.

--90KBcPA0h13nTGdQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/PMAAACgkQnKSrs4Gr
c8gavQgAw1mEua4Bu1as46tr75SMdL7OZIjXLc7U/7ipGFzF/CpY2dWW+pn/fmuo
Hti2GT73HxO/dNY0bQBdAlSt3khiO7ACSjUB9rd6+xz6YUlak8q6I3OyITFHSxT6
pJFrKX6oaOoVSkM127eYJ90cGqnJrAiWXjdlabuRXaW542cksyu4sRmUzaOiPATi
rCJRf4A9PGRpyuLouwi2iFUemk/M+JHp7xP1RA4TcNFF1POdTLL6Pz3u4tnLR0hs
O1/EQRfEPmXnMlW3ZHQdGm/Wzlvw09Z1So19n6Xhzst8cOzVXqtwA995/LbUugXr
eF5QMy92/O8yaVSwkQfQ6/ejnSWA1w==
=j5kK
-----END PGP SIGNATURE-----

--90KBcPA0h13nTGdQ--

--===============3743855145172989205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3743855145172989205==--
