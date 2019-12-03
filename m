Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3428110FAB9
	for <lists.virtualization@lfdr.de>; Tue,  3 Dec 2019 10:26:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B7CDF87E13;
	Tue,  3 Dec 2019 09:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOibg4ncVoou; Tue,  3 Dec 2019 09:26:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3167687E07;
	Tue,  3 Dec 2019 09:26:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01D3CC1799;
	Tue,  3 Dec 2019 09:26:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C104C087F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 09:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 519C787601
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 09:26:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l5VlBXuhi8dN
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 09:26:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A8B6F86F8A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 09:26:53 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b6so2796360wrq.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 03 Dec 2019 01:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SZdfC+gFtVklBpHF7XF3yKS4xbagQBubfYPugqhRugk=;
 b=aDs2YAsOEnOy5MORl6ZJIiOEESJ7SrV+tBNsG7s0DhwI8IAa+WmSS2HHd4QyjWGSJ/
 ldRTToqQ7fQK307trD2DA1pagxWm6spcShdYjO1bCT5zkFNurwT8D0qFsmSSEUBqQVn9
 Z2Zj1HZOONpz9ZI8OlPB6cYCLrisPtiHZPkN+kZ/Qkwrv6OYQdkg4ifUYV0RgQrtxBHy
 Ngqwe37IcYAgs+JB/PBz+qMv8mc+6lkEbD2x5TcMRk7CuL/LFUSdqB1iMLYZ4bG1D9G2
 wj0QR3TKc67oNoo5knJzrwdTSto5TOtorlUqVKc7rBt0YKFHYhH+mW0TIY8+1NlWPXWq
 fHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SZdfC+gFtVklBpHF7XF3yKS4xbagQBubfYPugqhRugk=;
 b=Sj2Io0KINPrlP/1mSc7Z++1H3TlzuWMZY8rjarU6fGNZEVXDjWMPokYCjdsCj7NcCP
 AZjzjAJODfFJB/7eYJQou5626eiAO5GV3znVgJIv4wBOKyjdIh+ZKICs4Q8aSnrRkWUU
 mArc6zOCMLIBmdLxuWvaH9/u9SJjVSm3P5zu6FzvwsObUzh70RcPJ/Ti6Di44AQJDvs7
 yChEu0RnLMX+zKBuuSLB5HEDGQD4DzVI1+/ralC6r/CODF4buuWKhvmhTQzD7LCxDl52
 3UGgl8szmyYlTk5RO/3Bv5TPO0iSH1O3LRbygCxLbPwjsg+iKvRGkq492WhSAdZCxHA/
 uswA==
X-Gm-Message-State: APjAAAXxOPHaFnQs1bBJt1itpFJogpTFWzrbVGE3tsDKgV545nrBehQz
 /wFpu2r5E/MU9K1I500+j+c=
X-Google-Smtp-Source: APXvYqyWUu9z3na0YvFr46Iqp7ei5QNeidd0TaMx3re4eCOYeNXe9t/Q0pvxheWa/uyUnaKqbmgSNw==
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr3806207wrr.32.1575365212035;
 Tue, 03 Dec 2019 01:26:52 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id v17sm2696979wrt.91.2019.12.03.01.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 01:26:50 -0800 (PST)
Date: Tue, 3 Dec 2019 09:26:49 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 0/3] vsock: support network namespace
Message-ID: <20191203092649.GB153510@stefanha-x1.localdomain>
References: <20191128171519.203979-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191128171519.203979-1-sgarzare@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Jorgen Hansen <jhansen@vmware.com>
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
Content-Type: multipart/mixed; boundary="===============1416234420332745454=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============1416234420332745454==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2019 at 06:15:16PM +0100, Stefano Garzarella wrote:
> Hi,
> now that we have multi-transport upstream, I started to take a look to
> support network namespace (netns) in vsock.
>=20
> As we partially discussed in the multi-transport proposal [1], it could
> be nice to support network namespace in vsock to reach the following
> goals:
> - isolate host applications from guest applications using the same ports
>   with CID_ANY
> - assign the same CID of VMs running in different network namespaces
> - partition VMs between VMMs or at finer granularity
>=20
> This preliminary implementation provides the following behavior:
> - packets received from the host (received by G2H transports) are
>   assigned to the default netns (init_net)
> - packets received from the guest (received by H2G - vhost-vsock) are
>   assigned to the netns of the process that opens /dev/vhost-vsock
>   (usually the VMM, qemu in my tests, opens the /dev/vhost-vsock)
>     - for vmci I need some suggestions, because I don't know how to do
>       and test the same in the vmci driver, for now vmci uses the
>       init_net
> - loopback packets are exchanged only in the same netns
>=20
> Questions:
> 1. Should we make configurable the netns (now it is init_net) where
>    packets from the host should be delivered?

Yes, it should be possible to have multiple G2H (e.g. virtio-vsock)
devices and to assign them to different net namespaces.  Something like
net/core/dev.c:dev_change_net_namespace() will eventually be needed.

> 2. Should we provide an ioctl in vhost-vsock to configure the netns
>    to use? (instead of using the netns of the process that opens
>    /dev/vhost-vsock)

Creating the vhost-vsock instance in the process' net namespace makes
sense.  Maybe wait for a use case before adding an ioctl.

> 3. Should we provide a way to disable the netns support in vsock?

The code should follow CONFIG_NET_NS semantics.  I'm not sure what they
are exactly since struct net is always defined, regardless of whether
network namespaces are enabled.

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3mKlkACgkQnKSrs4Gr
c8h54wf/eNE48AsDKZkZl+68dw3paeS7KLIQEPgUklUhfhqp/IHdX9uG2R88hvCl
rMCQbGHSMQ+yb7gPxN1+0tVXFX7Rf2Cqed4Lwqfq0VvufS80FUk4GiQZKKgk4LRv
/8x4or61TnKGbApxbJnQ+zdj1OirmGwrO8jEt4beMPgsfY80yzl6GcKwYwsOYzeg
w+28vrKtnprab8l8D0DnVIggTtyep72rsGdeOi4KtSmrUoM8GVExUDmwBQtUJ4xo
5+OJJjQ+EzPuKWxGIahFrZAHDGerrVHWyltH/LTq+BU0VNR+Ta726WWzDKVx7v6d
YQm7/TdSAT3l9Id0uVC9+DEM455UIw==
=v5qS
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--

--===============1416234420332745454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1416234420332745454==--
