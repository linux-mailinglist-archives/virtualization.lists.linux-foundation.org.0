Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB5BEF3FF
	for <lists.virtualization@lfdr.de>; Tue,  5 Nov 2019 04:19:30 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 74691F1E;
	Tue,  5 Nov 2019 03:19:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 523C7F11
	for <virtualization@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 03:19:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
	[207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id CBD6F189
	for <virtualization@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 03:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572923962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=j5OzLFkpAUjCP+yb4lupAMQyPwr8X3YeEPsxi0E3pqk=;
	b=idBUDc/L0fQPyhkz+QLD4dITLCRpESWGCz02q6XA28QK7ME0kIeGrhWHKmRnB2tP7c9oRV
	TSU6UdxMFB3cih1qi7RXBjeMonuEN9kTk0gM5SB1yfBl4ACqT4rXx/Qb2Kf9bRE9K6mLjh
	DqFWSoebVpZCPKvKtpb2jp4POCnQ1cQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-133-QYfxRTI1PLOj3fR3gSxtGg-1; Mon, 04 Nov 2019 22:19:18 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01604800C73;
	Tue,  5 Nov 2019 03:19:15 +0000 (UTC)
Received: from [10.72.12.252] (ovpn-12-252.pek2.redhat.com [10.72.12.252])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D2105D6D4;
	Tue,  5 Nov 2019 03:17:29 +0000 (UTC)
Subject: Re: [PATCH V7 3/6] mdev: introduce device specific ops
To: Alex Williamson <alex.williamson@redhat.com>
References: <20191104123952.17276-1-jasowang@redhat.com>
	<20191104123952.17276-4-jasowang@redhat.com>
	<20191104145008.4b6839f0@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <47ecfe09-0954-9517-3ac5-68db8522826d@redhat.com>
Date: Tue, 5 Nov 2019 11:17:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191104145008.4b6839f0@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: QYfxRTI1PLOj3fR3gSxtGg-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
	mst@redhat.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
	freude@linux.ibm.com, zhenyuw@linux.intel.com,
	parav@mellanox.com, zhihong.wang@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvMTEvNSDkuIrljYg1OjUwLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4+ICAgRVhQ
T1JUX1NZTUJPTChtZGV2X3NldF9kcnZkYXRhKTsKPj4gICAKPj4gKwo+IEV4dHJhIHdoaXRlc3Bh
Y2UKPgo+PiAgIC8qIFNwZWNpZnkgdGhlIGNsYXNzIGZvciB0aGUgbWRldiBkZXZpY2UsIHRoaXMg
bXVzdCBiZSBjYWxsZWQgZHVyaW5nCj4+IC0gKiBjcmVhdGUoKSBjYWxsYmFjay4KPj4gLSAqLwo+
PiArICogY3JlYXRlKCkgY2FsbGJhY2sgZXhwbGljaXRseSBvciBpbXBsaWNpdHkgdGhyb3VnaCB0
aGUgaGVscGVycwo+IHMvaW1wbGljaXR5L2ltcGxpY2l0bHkvCj4KPj4gKyAqIHByb3ZpZGVkIGJ5
IGVhY2ggY2xhc3MuICovCj4+ICAgdm9pZCBtZGV2X3NldF9jbGFzcyhzdHJ1Y3QgbWRldl9kZXZp
Y2UgKm1kZXYsIHUxNiBpZCkKPj4gICB7Cj4+ICAgCVdBUk5fT04obWRldi0+Y2xhc3NfaWQpOwo+
PiBAQCAtNTUsNiArNTYsMjYgQEAgdm9pZCBtZGV2X3NldF9jbGFzcyhzdHJ1Y3QgbWRldl9kZXZp
Y2UgKm1kZXYsIHUxNiBpZCkKPj4gICB9Cj4+ICAgRVhQT1JUX1NZTUJPTChtZGV2X3NldF9jbGFz
cyk7Cj4+ICAgCj4+ICsvKiBTcGVjaWZ5IHRoZSBtZGV2IGRldmljZSB0byBiZSBhIFZGSU8gbWRl
diBkZXZpY2UsIGFuZCBzZXQgVkZJTwo+PiArICogZGV2aWNlIG9wcyBmb3IgaXQuIFRoaXMgbXVz
dCBiZSBjYWxsZWQgZnJvbSB0aGUgY3JlYXRlKCkgY2FsbGJhY2sKPj4gKyAqIGZvciBWRklPIG1k
ZXYgZGV2aWNlLgo+PiArICovCj4gQ29tbWVudCBzdHlsZS4gIFRoYW5rcywKCgpXaWxsIGZpeCB0
aGVtIGFsbC4KClRoYW5rcwoKCj4KPiBBbGV4Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
