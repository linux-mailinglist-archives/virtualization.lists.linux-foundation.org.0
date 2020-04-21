Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A32801B2B66
	for <lists.virtualization@lfdr.de>; Tue, 21 Apr 2020 17:42:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 00FB987B32;
	Tue, 21 Apr 2020 15:42:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBkhHuZrpZ2T; Tue, 21 Apr 2020 15:42:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 49C4887AD1;
	Tue, 21 Apr 2020 15:42:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DC02C0175;
	Tue, 21 Apr 2020 15:42:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3628C0175
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 15:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B1AB487FC9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 15:42:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MmrsJhFJomqJ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 15:42:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CD38E87FB5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 15:42:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s10so7845042wrr.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 08:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=smCulfeM0i6IfFInFyIPYZ1woXDKmy7XMohFywAgL4M=;
 b=onCE8a9sWDTMpHJ5MLfvbv+ZBUE9S/7Cs3Xj9v4QkmAOq146uMO5Q88FIh8aXfQI5Y
 S5YfUqv+qeERvhQWTYVuY3JFHiVAHuW3PkT9/FFhAFrpc0JdmvZS/pM/knaJqY134q8d
 e9aS1UdmHDsVjdyyXVBIirNFNxefJ+GJ/M4zBG3bBftaJzoMOBcicD44bKlI22xHawvX
 Jr0rfBxUllcL0/m985SIa/9kUhDjqPhwWxSwSPS809RIT/w6F3avUqO09VZQopgtm7SM
 NAyszST8DbAVDFgcqYB9jWb2BAi0byTeYKdvhOOtay3WGhEB1OWQLf/9bs8UkV3Z3TKr
 nZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=smCulfeM0i6IfFInFyIPYZ1woXDKmy7XMohFywAgL4M=;
 b=j2f0is3a7h6kQ3VcWEPqEuTCxZKusN8O+XPlv0+wnR31s3leXai5KB8l93HelHbglv
 wzp9IbsLBmdbgwzHpE0MNgexz1PJDLmJYr7k8Rd8MIZMrDEJ9e2ULS1lh+cNUaV1dMxC
 QVDFFeJKbCJLOhREMPVhUr8SY3EnC2PkdaNbM44C+kEi7P9GPhktUCEX0PogbIGvreaq
 GEuAEU7iEGYUd+7KOzgHBakQVAsTd7dNCKgiE7e9IqKwyJYdSEIJlBRNZXKyAN0DGjBE
 MzWq1eYTQjp8nP83XKzy8/4UCGGuPGbEGE4v+eLrxqop3CDfMM9PwHlQFI3huu+2Nl9/
 2hag==
X-Gm-Message-State: AGi0PuauzKhOqxUTd4IOKA4dNE8K1B580uFhAILwzgXibt/5o49uWMxP
 StX1MBkXqsHsgsBDDuLIWuo=
X-Google-Smtp-Source: APiQypLxhyUQuMLlC/lZYEOaNY6oE6EnQ7qLe9/IuAI2gTFFfZgl+/1BfhPKJow73lUllSKMMFd6mA==
X-Received: by 2002:adf:e7ca:: with SMTP id e10mr25267486wrn.18.1587483770237; 
 Tue, 21 Apr 2020 08:42:50 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id a20sm4428579wra.26.2020.04.21.08.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 08:42:48 -0700 (PDT)
Date: Tue, 21 Apr 2020 16:42:46 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net] vsock/virtio: postpone packet delivery to monitoring
 devices
Message-ID: <20200421154246.GA47385@stefanha-x1.localdomain>
References: <20200421092527.41651-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200421092527.41651-1-sgarzare@redhat.com>
Cc: Gerard Garcia <ggarcia@deic.uab.cat>, kvm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net
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
Content-Type: multipart/mixed; boundary="===============3639693030722474511=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============3639693030722474511==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2020 at 11:25:27AM +0200, Stefano Garzarella wrote:
> We delivering packets to monitoring devices, before to check if
> the virtqueue has enough space.

"We [are] delivering packets" and "before to check" -> "before
checking".  Perhaps it can be rewritten as:

  Packets are delivered to monitoring devices before checking if the
  virtqueue has enough space.

>=20
> If the virtqueue is full, the transmitting packet is queued up
> and it will be sent in the next iteration. This causes the same
> packet to be delivered multiple times to monitoring devices.
>=20
> This patch fixes this issue, postponing the packet delivery
> to monitoring devices, only when it is properly queued in the

s/,//

> virqueue.

s/virqueue/virtqueue/

> @@ -137,6 +135,11 @@ virtio_transport_send_pkt_work(struct work_struct *w=
ork)
>  			break;
>  		}
> =20
> +		/* Deliver to monitoring devices all correctly transmitted
> +		 * packets.
> +		 */
> +		virtio_transport_deliver_tap_pkt(pkt);
> +

The device may see the tx packet and therefore receive a reply to it
before we can call virtio_transport_deliver_tap_pkt().  Does this mean
that replies can now appear in the packet capture before the transmitted
packet?

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6fFHYACgkQnKSrs4Gr
c8gyawf/T+a2xJRtBkyZjuaj7XH+djH+xU923vloo0YRur+sYDLhisPt7kU7x0E9
NXQvUSZKmd8iUUUDDBeJPpa86l7OisNvebRkWrpj1pOWKl0aOiRG7h7nsRM7+0O4
hZZ84Hpaq05u6KYAJvtwMXGBtb+Vn3m3CqLf2fEt+Z1xZ+laJhgQD66f/6/HEeVz
Y2bBrSwjULMJSzy5rGaqDAeewofwWYdK6XPnNXsOHcfcCN3a3Ioy9/GcRfx/8paa
vswqRKN0nbWhj/xk0dsWoK64CmBFZ7S2wDOztjQ6gtqZ9oG1LzMCWvv/JZADJAPX
Z64ss/NhhySeVpAIhPrpkFXBVYFuLA==
=zD+X
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--

--===============3639693030722474511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3639693030722474511==--
