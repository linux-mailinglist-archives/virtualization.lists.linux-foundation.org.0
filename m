Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F2A1722E0
	for <lists.virtualization@lfdr.de>; Thu, 27 Feb 2020 17:11:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AF05887F1F;
	Thu, 27 Feb 2020 16:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2pnrejAONVLq; Thu, 27 Feb 2020 16:11:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E131B87F52;
	Thu, 27 Feb 2020 16:11:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF308C0177;
	Thu, 27 Feb 2020 16:11:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BF67C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 16:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 061C7868BF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 16:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jhMPyVxpztUM
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 16:11:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D507F84D5E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582819873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=baOVStFi/SNG29sbg/ucY09+VCW+eczt7xzz7SmVLS4=;
 b=D5/70dFjBGR1x6K5TCDK/j+zZ1AHpRfnyzfwVsjw4koT2Za7Z2dlwBeyu5IYwYL6u3eMhE
 mGXNts2lo5+M9Dfggmhgwa9Cq1r0/LNhrftIcbLugkbF38AdcKqE6zl+va2KiYD3nPB552
 mx49TdHmEfqKhRUPRoZl4E59Z39Xh5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-5nDBex09N9-vClpZCVygwA-1; Thu, 27 Feb 2020 11:11:08 -0500
X-MC-Unique: 5nDBex09N9-vClpZCVygwA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D43FDB68;
 Thu, 27 Feb 2020 16:11:05 +0000 (UTC)
Received: from localhost (ovpn-117-38.ams2.redhat.com [10.36.117.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EE2760C63;
 Thu, 27 Feb 2020 16:11:03 +0000 (UTC)
Date: Thu, 27 Feb 2020 16:11:02 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net] vsock: fix potential deadlock in transport->release()
Message-ID: <20200227161102.GC315098@stefanha-x1.localdomain>
References: <20200226105818.36055-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200226105818.36055-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Sasha Levin <sashal@kernel.org>, Hillf Danton <hdanton@sina.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 syzbot+731710996d79d0d58fbc@syzkaller.appspotmail.com, kvm@vger.kernel.org,
 netdev@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 davem@davemloft.net, Jorgen Hansen <jhansen@vmware.com>
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
Content-Type: multipart/mixed; boundary="===============0579982843253719746=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============0579982843253719746==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Content-Disposition: inline

--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 11:58:18AM +0100, Stefano Garzarella wrote:
> Some transports (hyperv, virtio) acquire the sock lock during the
> .release() callback.
>=20
> In the vsock_stream_connect() we call vsock_assign_transport(); if
> the socket was previously assigned to another transport, the
> vsk->transport->release() is called, but the sock lock is already
> held in the vsock_stream_connect(), causing a deadlock reported by
> syzbot:
>=20
>     INFO: task syz-executor280:9768 blocked for more than 143 seconds.
>       Not tainted 5.6.0-rc1-syzkaller #0
>     "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this mess=
age.
>     syz-executor280 D27912  9768   9766 0x00000000
>     Call Trace:
>      context_switch kernel/sched/core.c:3386 [inline]
>      __schedule+0x934/0x1f90 kernel/sched/core.c:4082
>      schedule+0xdc/0x2b0 kernel/sched/core.c:4156
>      __lock_sock+0x165/0x290 net/core/sock.c:2413
>      lock_sock_nested+0xfe/0x120 net/core/sock.c:2938
>      virtio_transport_release+0xc4/0xd60 net/vmw_vsock/virtio_transport_c=
ommon.c:832
>      vsock_assign_transport+0xf3/0x3b0 net/vmw_vsock/af_vsock.c:454
>      vsock_stream_connect+0x2b3/0xc70 net/vmw_vsock/af_vsock.c:1288
>      __sys_connect_file+0x161/0x1c0 net/socket.c:1857
>      __sys_connect+0x174/0x1b0 net/socket.c:1874
>      __do_sys_connect net/socket.c:1885 [inline]
>      __se_sys_connect net/socket.c:1882 [inline]
>      __x64_sys_connect+0x73/0xb0 net/socket.c:1882
>      do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
>      entry_SYSCALL_64_after_hwframe+0x49/0xbe
>=20
> To avoid this issue, this patch remove the lock acquiring in the
> .release() callback of hyperv and virtio transports, and it holds
> the lock when we call vsk->transport->release() in the vsock core.
>=20
> Reported-by: syzbot+731710996d79d0d58fbc@syzkaller.appspotmail.com
> Fixes: 408624af4c89 ("vsock: use local transport when it is loaded")
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  net/vmw_vsock/af_vsock.c                | 20 ++++++++++++--------
>  net/vmw_vsock/hyperv_transport.c        |  3 ---
>  net/vmw_vsock/virtio_transport_common.c |  2 --
>  3 files changed, 12 insertions(+), 13 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl5X6hYACgkQnKSrs4Gr
c8hIwwf/VpB7q37vIv4l2+NFuq3CWGZbLfSSG7A9u4sXSo+VhcEltqh8jdz8xEfS
k9JaAaCosM43HAtz+LPmfHG6eL761HjpUQ9KnLgU53aWhJwFuIv000o2w+OA3X4O
cr1aWzcWJzFpkU1xQb41J1FR8FUymgWSqQPitEF3ElEnmbfFGSrEgrVOc9Ou2Qhb
57r4rlPuiZNNshiWMjCalPewQeJETnrEnB9cxsjc0gMu/xn1KRE7g6i4yG1smtjm
YSgZmV1NgDWrAKr//amiOCqTvKH2DUYYgvUwnx27G0iRrWO47TQYbE+/jDd+FUol
u2jPzVcR0q/qq1CJsyPqKx+7pdCqUg==
=t+mC
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--


--===============0579982843253719746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0579982843253719746==--

