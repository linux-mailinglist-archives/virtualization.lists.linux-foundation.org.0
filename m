Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EB118D0E0D
	for <lists.virtualization@lfdr.de>; Wed,  9 Oct 2019 13:54:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 926E5F7B;
	Wed,  9 Oct 2019 11:54:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B912AF68
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 11:54:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8BE46709
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 11:54:36 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r19so2228831wmh.2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 09 Oct 2019 04:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=K8xuIIKxM4jr1Ezc8qWxiUcuTrmdodaACnbuRgrOwy4=;
	b=GxeHshJj+pdQQGjLZMzMN4EUBZaXzB04GuP45+JvMpVKsr3ERgg4f1ZQEsslNFQgVV
	5fdzzDUW1CKqZD7zcCNIogsT5shD3oQG/dKx9UAXikI4JgTgn9UYj7XkluVRFNbB0Tz7
	TUaxxYn3QH0oHUo/tMnl6EAP13Ze+HSDtziaHGgvnjKvEcqX4zFh74vIAB5wdfeOuux/
	ppK7L2kobeIinaHOPQtgDHv7O3MgN6NWhMon6AVidemhPFfqAwzO9A81fx8zR/1bBnV3
	QbcnoA00+0ZVLHd+lii0sTPxLS87csmc4par/EdmeSMwPC1qihpecG587Ol6WNNgH4qX
	e8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=K8xuIIKxM4jr1Ezc8qWxiUcuTrmdodaACnbuRgrOwy4=;
	b=F95Nb6v/E61j0icpcv3375awgT6borv2XHHtwlYSo+9gaIVLspdL4AeBVqsl0OpHQd
	UNz34bFM/LrEXLUxYWDrCXIUxOof9HxxG0q8yTBOjEKoWQ4nFGSeeXTXUm2bofFK/Uqd
	UbbQnFmIQU67zDrkQH+jqTyiogmtA4ry89Q5xNpjBCsI8D/sY363Thzpc0B5FPR2yT8h
	dSIrzDaUQWW0yFUIJqvvDv1fyMUVE0SimbRMa3wvv8FAxc964z9tC2vRrk7Gw4eC2zMS
	CZGwxh/Kkxm1WH2Ppb8K17YrZ3TnztZzDxe8tVAn8PCz1yGT13DKXigQKe2YJ27wBIJE
	iMwQ==
X-Gm-Message-State: APjAAAVY6SoNmt6rQytxAG3tpyU60/SJt0/vLY0v4h7i6uenA49X3Aaf
	gQThPrMCITlK4lTzQZ3MLdo=
X-Google-Smtp-Source: APXvYqwzyNhjFy4mMbFEikZ//E8PDfqotwLY5TpxA1ZDPjhg8ZiTa057fShpgEBfYZvhww31eMEocQ==
X-Received: by 2002:a7b:c049:: with SMTP id u9mr2276879wmc.12.1570622075184;
	Wed, 09 Oct 2019 04:54:35 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id z9sm1734307wrp.26.2019.10.09.04.54.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 04:54:34 -0700 (PDT)
Date: Wed, 9 Oct 2019 12:54:33 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 06/13] vsock: add 'struct vsock_sock *' param to
	vsock_core_get_transport()
Message-ID: <20191009115433.GG5747@stefanha-x1.localdomain>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-7-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190927112703.17745-7-sgarzare@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
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
Content-Type: multipart/mixed; boundary="===============6907763690376517684=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============6907763690376517684==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S5HS5MvDw4DmbRmb"
Content-Disposition: inline


--S5HS5MvDw4DmbRmb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 27, 2019 at 01:26:56PM +0200, Stefano Garzarella wrote:
> -const struct vsock_transport *vsock_core_get_transport(void)
> +const struct vsock_transport *vsock_core_get_transport(struct vsock_sock *vsk)
>  {
>  	/* vsock_register_mutex not taken since only the transport uses this
>  	 * function and only while registered.
>  	 */
> -	return transport_single;

This comment is about protecting transport_single.  It no longer applies
when using vsk->transport.  Please drop it.

Otherwise:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--S5HS5MvDw4DmbRmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2dyngACgkQnKSrs4Gr
c8jpGwf+OKGaK9OPf0rceIKo+5pdDJMkf+lhw9ooooqK7bZFZkqZFYhUYOP9qYqk
iPKeaY6YWLpuWMJRuh2EObxLrC1VrmfYA1lPcNXDEq6yVOloX43zrBM5Zec2GVq3
GVJHTW2tw1bTyRAtLI/zSYy9hblQlWcG6BKmK1WBNFIyQ9JLGvRqFGKobpJPP2LS
/7z3MWkRsZkFTUnJGocbhjbkZk2dLUwY9cy/IrOzfPAgX79WB7DSl7RpjH/hx7+b
M8cDi9WDJ53vRN81sXNSHg8JQA3x+DoErU3TdY1sTxSyHqcZiPgI13LXZmIw3wSS
W8aTJLNML/vAaTn6rvoGHkQXwt3Izw==
=2X/V
-----END PGP SIGNATURE-----

--S5HS5MvDw4DmbRmb--

--===============6907763690376517684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6907763690376517684==--
