Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9FB104F85
	for <lists.virtualization@lfdr.de>; Thu, 21 Nov 2019 10:46:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 152BE887C0;
	Thu, 21 Nov 2019 09:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iy5F33hbj63Q; Thu, 21 Nov 2019 09:46:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7F3E0887B9;
	Thu, 21 Nov 2019 09:46:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 651BCC18DA;
	Thu, 21 Nov 2019 09:46:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DBECC18DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 09:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5CEC5887CA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 09:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ErjrZCX2yRK
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 09:46:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 52F40887B9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 09:46:18 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y5so2884268wmi.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 01:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Zq604zfFYaP1lg3EZmX/ZaHb/wgc+8oQ8qyObi+Xugk=;
 b=EqWQIKk+Pc+6l/iTZqHgRlRZKxdn4V5MLvDyH0ww5S+V+fMSCiyEKuvRNjME92kpzR
 xcVvIZLkVoemqT088j6zTquIIRlUtFPaJuPbj1gRvRqz9mkwPyu9vQ6n8z+t2yM32vCz
 pDquaI0iz8FNlE2lh/MIGSO4oj+ofk8tt9/yAQbbgYHMgE+uXnFhDEaOF55hmhCeo6gZ
 LqyQHu1s+IZNMbJwy0SkDh4yiE8HuRicUZlJt7NAsuUyMRaekXE7UDU7Rx6NE/3Efqhc
 grH+DPrIOumY2l92QPIrd6f2xxrX25HXk1PnobD//XAPU3rxd+ttp1nIZ8rmAVLfSebm
 3s0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Zq604zfFYaP1lg3EZmX/ZaHb/wgc+8oQ8qyObi+Xugk=;
 b=SYu0hLTS187lusnCQMrRg2rwq5puSvRq8yuxxvJKO4jY0RsaVjNEOXfERF4c4rxWhV
 bgDFg4CeKVFYEV51kfrIIHp7jbMW0greN/tpeeILM9BquxJ95x4fVGVfmWV7YqFM01tx
 odUdH3sDnSLvzjlS73Bfx+RW1o1uK72NhBdYkySez93CpXfAFJtOMh+ZMuKGOSrRo/Bu
 OhwyLc32XxCWDVnihQy5Omd0KqXv5CrZ7P5VeKtzkLh4bgbqTh4ecujgdOkCVuSrkfPv
 k7iEZGGmjyAPddx/S2ye3cJBOq2Z/y6ck+fpBF8oeaOlzDUpFYeCNB6Vh284JYKrdbLo
 Uf2A==
X-Gm-Message-State: APjAAAVZNXB0QJXxLR/h7k8WmLcK2mCFg2bZmgGBCtaiNOmmPlr17XJ9
 xm3iM6ehaCNYzwfn00+dBG4=
X-Google-Smtp-Source: APXvYqyZ8t14KdyBL7WZHEesuhWgOkStCUSzngEXJC35eulov2avg9DZSJMo7BWYsnIIGFoYvTWJJg==
X-Received: by 2002:a1c:a406:: with SMTP id n6mr9076240wme.90.1574329576856;
 Thu, 21 Nov 2019 01:46:16 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id i203sm1972471wma.35.2019.11.21.01.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 01:46:15 -0800 (PST)
Date: Thu, 21 Nov 2019 09:46:14 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net-next 5/6] vsock: use local transport when it is loaded
Message-ID: <20191121094614.GC439743@stefanha-x1.localdomain>
References: <20191119110121.14480-1-sgarzare@redhat.com>
 <20191119110121.14480-6-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191119110121.14480-6-sgarzare@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
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
Content-Type: multipart/mixed; boundary="===============4133274744528085402=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============4133274744528085402==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline


--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 19, 2019 at 12:01:20PM +0100, Stefano Garzarella wrote:
> @@ -420,9 +436,10 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
>  		new_transport = transport_dgram;
>  		break;
>  	case SOCK_STREAM:
> -		if (remote_cid <= VMADDR_CID_HOST ||
> -		    (transport_g2h &&
> -		     remote_cid == transport_g2h->get_local_cid()))
> +		if (vsock_use_local_transport(remote_cid))
> +			new_transport = transport_local;
> +		else if (remote_cid == VMADDR_CID_HOST ||
> +			 remote_cid == VMADDR_CID_HYPERVISOR)
>  			new_transport = transport_g2h;
>  		else
>  			new_transport = transport_h2g;

We used to send VMADDR_CID_RESERVED to the host.  Now we send
VMADDR_CID_RESERVED (LOCAL) to the guest when there is no
transport_local loaded?

If this is correct, is there a justification for this change?  It seems
safest to retain existing behavior.

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3WXOYACgkQnKSrs4Gr
c8iT+Qf9ESuEFX++6Sq/wJtYnpiX6cvGw7bvw+fxkdiksMzIPBWT6ZbC/ZrRv87z
zBMNmGrLElTPu3lN4ISYgd1gjrLn1iTTnkj/A42X5VvjEqfQYXNz84gBMP7jRcxo
XufjkgajBvxcssZgAPOAMjx/4BbGlW3cwUNoTa7oy9PCQlhBPVDvqPWSM4sQ61cP
GJ2hFaCeYTmCbYKnyrvqmoXIewMF1XAjAuuXSHz7zVlCpbHL21piJByTKAUnqL7N
6W6nMibNjso9qI0AYAOsCkFRnhIshBqRhRhO96/1ZEBmLe7kH6gXYpgScRs4IRYD
V7w4kz76mzwiZZZLiW4/K5FOBe8v9Q==
=HSd8
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--

--===============4133274744528085402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4133274744528085402==--
