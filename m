Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 158A5CD957
	for <lists.virtualization@lfdr.de>; Sun,  6 Oct 2019 23:42:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9D51A49F;
	Sun,  6 Oct 2019 21:42:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CE2DC255
	for <virtualization@lists.linux-foundation.org>;
	Sun,  6 Oct 2019 21:42:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
	[209.85.217.44])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DE46127B
	for <virtualization@lists.linux-foundation.org>;
	Sun,  6 Oct 2019 21:42:26 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id b123so7633116vsb.5
	for <virtualization@lists.linux-foundation.org>;
	Sun, 06 Oct 2019 14:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H0Qql8beNpv48V0E+O5GhBKyZ0tQotYI/Tm9AQMWPqc=;
	b=Xo/82LL2eCQAg3/A0NV9g2MotJYX9J0P4tZRa4zlEYJcx0+hFN62Mah+vVjFemC/8v
	TR9IoTqTLBYjV3X+lFxm9N0vBSmbHSvvfixaSFd+DRbrWmQ4zY3QgqHr4fvT/IUQXBCr
	d21H2+uc8VOPNXH6Q9J89PAbPH9pMhVCO7BcVQe1aOekvc+DiPwRY3omp2f8T5agwwsR
	RCadB/s3xHFWND8849mdT4D8gA0RI3DYQ9FuBb/e47rygX4o7TUmRZMEbGC8Feuy5QD2
	+zzoblN3T0SzFuGmNoNBt5g/sKaPtKM8I22qkmOjtaj95EtsFfDMi9R/hIDrt+6ErJzV
	9c/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H0Qql8beNpv48V0E+O5GhBKyZ0tQotYI/Tm9AQMWPqc=;
	b=cDmn1y1K2l/+LhfVhhIHm3YxRKHHcpot74BA7lyIw0Fm3i02MikZ0jUKMqO7Be7Uk+
	05zuIznncuPR1G0sPRHzG+6rqtQMlj7bMI6XBs71INPX2g8egGOhQ94bfsgDy2hPPoEP
	IG3NnEtdL3lA1Njm93RR7i+iCHZ0B7q2vc4C8pnCGbMtMSlEVV+Hrx6FPAwYwQDgXq+F
	HwNSdoMCoD4ViVcrE11wPHxoePFPQrJRJINzd5bFH4JH7emSoGcOhRguhO+qvbYP4cH5
	CFCrqC1HtURYI++4p8qFadW6dQcBxO8D+aUs8pSQa8GcTGKh2N8xfzPd85uw96aQJdiU
	+hXA==
X-Gm-Message-State: APjAAAWocIxkckO9X65jSRxBxsRnCpvRykABs3CDEoM0JOIgyPY8YPzR
	2yluflmaqwSgHDX+0N7VrPOeWbMHPBHacLjYSAglDA==
X-Google-Smtp-Source: APXvYqxPdlRduzJwi2u5NmApFlM91SBk7vaTnsOTSUbnVX8i8r7ZAKWtJeyBKkI7P3bbqTWx+8hUX9EjlIbhS48bRcg=
X-Received: by 2002:a67:f2c9:: with SMTP id a9mr4425990vsn.160.1570398145688; 
	Sun, 06 Oct 2019 14:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <5D7EE856.2080602@intel.com>
	<09257686-90df-5c31-c35f-9d16fc77fee1@redhat.com>
	<CAJuQAmpQV26kb9vTyoW-Q7PsD0SOfX+otkiQZAks1L6k7rgdig@mail.gmail.com>
	<20191003142854-mutt-send-email-mst@kernel.org>
	<CAJuQAmrCiPsofYpDvm8=i32d9c9yCmKpJRBSRFkeubP_2=XKtw@mail.gmail.com>
	<0df87f00-5102-973b-3a7a-735e44f4ac3f@redhat.com>
	<20191004043446-mutt-send-email-mst@kernel.org>
	<30c6feba-7037-b52f-3ef4-4a5c50be0aff@redhat.com>
	<CAJuQAmpwQ4guGtHTTWC60EAYBuJ264d6CgWmWEHSnb8-CRtWBw@mail.gmail.com>
	<859eada9-d3e2-8f28-ebd6-a8cb562dbff5@redhat.com>
	<20191006073919-mutt-send-email-mst@kernel.org>
In-Reply-To: <20191006073919-mutt-send-email-mst@kernel.org>
Date: Sun, 6 Oct 2019 14:42:14 -0700
Message-ID: <CAJuQAmpbmTq8mwYCf1G9Qr7ZB0WtG3VCVyfbEYsm6qUOM1N9Zw@mail.gmail.com>
Subject: Re: VIRTIO_BALLOON_F_FREE_PAGE_HINT
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DOS_RCVD_IP_TWICE_B, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: virtualization@lists.linux-foundation.org
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
From: Tyler Sanderson via Virtualization
	<virtualization@lists.linux-foundation.org>
Reply-To: Tyler Sanderson <tysand@google.com>
Content-Type: multipart/mixed; boundary="===============7426871338427871768=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

--===============7426871338427871768==
Content-Type: multipart/alternative; boundary="000000000000a18f2b059444cffa"

--000000000000a18f2b059444cffa
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 6, 2019 at 4:48 AM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Sun, Oct 06, 2019 at 10:30:40AM +0200, David Hildenbrand wrote:
> > Please note the "use outside of a testing or debugging environment is
> > not recommended". Usually you want a "soft" version of this, e.g., via
> > the OOM handler (so only drop parts of the cache, not all).
>
> Right. We'll need something softer I guess. By how much, I don't know.
>

It should be left up to the guest system administrator to configure the
trade off between performance and cache memory reclaimed.
And the primary performance metric would be cache hit rate.
So maybe some configuration option that lets you drop cache pages that have
a hit rate less than X per minute.
Or more simply: Pages that haven't been hit in the last X seconds.

The other way to do it would be to set a strict cache size limit, but that
would be workload dependent and toilsome to tune correctly, so it seems
like a worse choice.


>
> --
> MST
>

--000000000000a18f2b059444cffa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 6, 2019 at 4:48 AM Michae=
l S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Oc=
t 06, 2019 at 10:30:40AM +0200, David Hildenbrand wrote:<br>
&gt; Please note the &quot;use outside of a testing or debugging environmen=
t is<br>
&gt; not recommended&quot;. Usually you want a &quot;soft&quot; version of =
this, e.g., via<br>
&gt; the OOM handler (so only drop parts of the cache, not all).<br>
<br>
Right. We&#39;ll need something softer I guess. By how much, I don&#39;t kn=
ow.<br></blockquote><div><br></div><div>It should be left up to the guest s=
ystem administrator to configure the trade off between performance and cach=
e memory reclaimed.</div><div>And the primary performance metric would be c=
ache hit rate.</div><div>So maybe some configuration option that lets you d=
rop cache pages that have a hit rate less than X per minute.</div><div>Or m=
ore simply: Pages that haven&#39;t been hit in the last X seconds.</div><di=
v><br></div><div>The other way to do it would be to set a strict cache size=
 limit, but that would be workload dependent and toilsome to tune correctly=
, so it seems like a worse choice.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
-- <br>
MST<br>
</blockquote></div></div>

--000000000000a18f2b059444cffa--

--===============7426871338427871768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7426871338427871768==--
