Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FA1E6326
	for <lists.virtualization@lfdr.de>; Sun, 27 Oct 2019 15:43:40 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A6ED3B09;
	Sun, 27 Oct 2019 14:43:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8ADCB499
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 14:43:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DF7A914D
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 14:43:31 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a11so7222026wra.6
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 07:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=YTHjpx5tynN5ysNBWnDF8q0AZsL3oz0jYtEIvTs3UB8=;
	b=nywAXHaYFmYMIY+hAOelcPD7dFa0WvtZ4hopNPXAcgcSOOWBR3qexe4p3jR+opMRem
	lCugMtCFnPAa3bYeCi5XUQ9nsJjqAlyMBdtErBu6QfX4HiRClOJ9XlX/YzaCltObVthY
	kmmcXvFX9SHiQPo0V8Unp3F6q7o//WoKIRf54n4rgXnKWx+n76nNudLg2fyVX0LLKjl/
	PT3bvONLPl3UJdPbe/wn9J2+LWtGQS93qOk5kt8AjOXmyRaf7eStSgqKHH+1RGIB+vJI
	cYBywcXCz6MGJOcKDf2v81F7FSxmlhMvDjS20n5zV5P+PuVCUmoFOu+G1edytmO2HiIq
	fAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=YTHjpx5tynN5ysNBWnDF8q0AZsL3oz0jYtEIvTs3UB8=;
	b=csCBw2w7urs9Bks440bE1ksB0UOEmqDX8Vk+WdCoViAr5woJb4JjU7Ew79bANvJEjv
	yYkCrvbGA2nNcNXJKMBtj2puYfIqvP26c0tPEpuMpSDY0qUZVGQi4W+oWygMyQvWwl2R
	5y8uilNUfjP1nkuG2mizQDk4AEB4KhuKhS4yXXG2M36VSRnC2j9MvnwZNxb1r8xgUrs+
	5kkOIkBk0IRgYEGaIqeYyufHHA9nYMZjAvo0M4XKxSiA2PVZGIMAowoTgDfsVnBV8QT8
	RQRK/8wbnZiGqVErTvYU11FfaUOAOk3KKy3IpdxLrCkoItFk1Q3P8ckeauhv/KFNxX8b
	v9+Q==
X-Gm-Message-State: APjAAAW6C6pAeyHCXv9JEz4xRQUXOvWcv6kdsTeByXbuCoCMd6pMuhV7
	cIM1PR5ilO9xmSY9mLDMH/M=
X-Google-Smtp-Source: APXvYqwJ+H4xcrTifNRyujk7kct3/jugAiLCESyoG4j0g4CEAKEOyPB8CuSko//m+TkPGmo0KYgcvQ==
X-Received: by 2002:a5d:4705:: with SMTP id y5mr11261749wrq.364.1572187410396; 
	Sun, 27 Oct 2019 07:43:30 -0700 (PDT)
Received: from localhost (94.222.26.109.rev.sfr.net. [109.26.222.94])
	by smtp.gmail.com with ESMTPSA id
	n17sm7655453wmc.41.2019.10.27.07.43.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 07:43:29 -0700 (PDT)
Date: Sun, 27 Oct 2019 09:01:46 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net-next 00/14] vsock: add multi-transports support
Message-ID: <20191027080146.GA4472@stefanha-x1.localdomain>
References: <20191023095554.11340-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191023095554.11340-1-sgarzare@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============7542246376614576319=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============7542246376614576319==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2019 at 11:55:40AM +0200, Stefano Garzarella wrote:
> This series adds the multi-transports support to vsock, following
> this proposal: https://www.spinics.net/lists/netdev/msg575792.html
>=20
> With the multi-transports support, we can use VSOCK with nested VMs
> (using also different hypervisors) loading both guest->host and
> host->guest transports at the same time.
> Before this series, vmci-transport supported this behavior but only
> using VMware hypervisor on L0, L1, etc.
>=20
> RFC: https://patchwork.ozlabs.org/cover/1168442/
> RFC -> v1:
> - Added R-b/A-b from Dexuan and Stefan
> - Fixed comments and typos in several patches (Stefan)
> - Patch 7: changed .notify_buffer_size return to void (Stefan)
> - Added patch 8 to simplify the API exposed to the transports (Stefan)
> - Patch 11:
>   + documented VSOCK_TRANSPORT_F_* flags (Stefan)
>   + fixed vsock_assign_transport() when the socket is already assigned
>   + moved features outside of struct vsock_transport, and used as
>     parameter of vsock_core_register() as a preparation of Patch 12
> - Removed "vsock: add 'transport_hg' to handle g2h\h2g transports" patch
> - Added patch 12 to register vmci_transport only when VMCI guest/host
>   are active

Has there been feedback from Jorgen or someone else from VMware?  A
Reviewed-by or Acked-by would be nice since this patch series affects
VMCI AF_VSOCK.

Stefan

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl21TucACgkQnKSrs4Gr
c8jY1wf9G0k0TNCkBEFILNq2f7qw5oF5+pTf1Of9V+p/S4tsTcWiHPLrYThBzZui
QJ/Zws7KFQcXB/7+e8RQ4SXI/iMLoPtaEFK3euKQg0N48xlULtw2XuiMVuaAsTsl
iaEmsyI21PQlM7zeMFTfqt0wxt2H6MebdP4DyrfhbKvFKmzAAy7v0Xq3vtv6/ZX6
AIVIDuKDo19J9oe9ZKF51lvMe4Ndd7ynKNDD+2s2ZrrF31/uuQkE6K2ZUMjTDQVR
zcK2K/aHtAnz+98XtneyrQAlc4JV0lTIZOMB2aTS4ZQ1sHssYiwGbF/j4fR2Dj0n
iFHeCiwo4mQ5+1RKCoFZbtObs2ilQw==
=wYuh
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--

--===============7542246376614576319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7542246376614576319==--
