Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B413E6338
	for <lists.virtualization@lfdr.de>; Sun, 27 Oct 2019 15:44:05 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4E73DAE7;
	Sun, 27 Oct 2019 14:43:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CFE47B4B
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 14:43:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6D06A14D
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 14:43:36 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id o28so7226489wro.7
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 07:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8m+44Vom44C3KhaUynaGnY+KEBMnlLX9FyMyBId8qoU=;
	b=NQH/OeWG8WdxJzcEjzA4jcs0prQEWO9Pvc/hRibnmA2kGfBX9GXKEPzG8QBt0r5gt5
	WjLH9+UgxdiMjt+Upsns+/VTt4xZduF/oj+56GLFkWyGTeKIpVPddDxRQ18hMU6VTzeS
	Q3APORHOhFrh88B0ZczEmBrll1sBbpDk005nfDYQ/7lqddPN6exe7WgjGRpcLNfCPILS
	+14lN+4eH5gYalHUk+tGCUcgJEewmLLRDKhU7lLUE4pyu4YYaZl3gnGoFEdH1F25bdIf
	XVk9yXZgNi8mgQrhxWHxwRSseL6MeWEYAlASPhmRobVUJyTznxd8fFxLT1eXbZbR6cvB
	bVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8m+44Vom44C3KhaUynaGnY+KEBMnlLX9FyMyBId8qoU=;
	b=HcFa8oAEMvokG8F2lQK9qu+rc7Mk8eEc1F80qVuwNU6DPvNP93OpVnNxXvsWuL1Zj6
	dxpHLQwpzh0TEblqnN4LZ+Ox/83lrtW3Ibfe9SXuZpMWM7lMiDEyKCv4if7uBN9UP6d/
	r+YR5mIpQqqN9WBi4SnC+WCV+iFe94bY+Mhy2ARkwzKTagbKAUT266ClAHQWZymO7GUK
	m6270uiLnjJpBf9WP5gNgGVT0mYgag/948p9DTkHnBNTHAUZerMu/aqiSgMNZygvDTJo
	/ClgtJK5czvcfwrhUNofD0J0MYSFwVLW9FAQYGLB4UXNvJjFsUeh7s3cVBV/PwTxqlvW
	8Y1g==
X-Gm-Message-State: APjAAAVqic2VRAhRMtTDwKJMBAeJf0TPUS0TO61mOzsUNZyrSY9+QQTl
	hVST1ASmzkoHYIDD1yQYOjY=
X-Google-Smtp-Source: APXvYqyiG2KCZCSee9Vwv5D88dH0uhGwkGZqT0L2pQDFD9DyKBWheclB6McEARrC/xn+QILCohGoMQ==
X-Received: by 2002:a05:6000:92:: with SMTP id
	m18mr11842859wrx.105.1572187415060; 
	Sun, 27 Oct 2019 07:43:35 -0700 (PDT)
Received: from localhost (94.222.26.109.rev.sfr.net. [109.26.222.94])
	by smtp.gmail.com with ESMTPSA id
	f17sm8378029wrs.66.2019.10.27.07.43.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 07:43:34 -0700 (PDT)
Date: Sun, 27 Oct 2019 09:17:52 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net-next 12/14] vsock/vmci: register vmci_transport only
	when VMCI guest/host are active
Message-ID: <20191027081752.GD4472@stefanha-x1.localdomain>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-13-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191023095554.11340-13-sgarzare@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00, DATE_IN_PAST_06_12, 
	DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0117337910579865229=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============0117337910579865229==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C1iGAkRnbeBonpVg"
Content-Disposition: inline


--C1iGAkRnbeBonpVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 23, 2019 at 11:55:52AM +0200, Stefano Garzarella wrote:
> +static int __init vmci_transport_init(void)
> +{
> +	int features = VSOCK_TRANSPORT_F_DGRAM;

Where is this variable used?

--C1iGAkRnbeBonpVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl21UrAACgkQnKSrs4Gr
c8iGGgf/YjP9kPT916spdjeVdu2Wg8PPuw60Kt/da2i6Qp1hdl0CTXaK1RJxoH8F
FYtdWNROfs6CPSHEP5xVD4xBeHvZEST4BgeVr/hFZYbw4F5vVb9OIDpSln7JkN/r
zldMb0Q+UjbvTUZm9buMeb08nbzn9CdeaCJDGPIRHOZjDNw+wL0cilfVm5NMDR4L
pNbLtyJJliiIZeh2CxCu0k8Kd25OUlwDfqHHuFvDn/kmcNyQlVOUwb0VRnDts8mW
ian+XNpRXDY24xdyZ9F2UxA6wvwOleFhEN/La2euNs8Iv38liHKNgiCDHe/+br/t
vuMWadKe9tonhgk7iUlCA5hNDKgKiQ==
=CXM0
-----END PGP SIGNATURE-----

--C1iGAkRnbeBonpVg--

--===============0117337910579865229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0117337910579865229==--
