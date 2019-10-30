Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 54799E96F5
	for <lists.virtualization@lfdr.de>; Wed, 30 Oct 2019 08:05:19 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B1567FCB;
	Wed, 30 Oct 2019 07:05:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 27CEFFBE
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 07:05:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id B2B9B8A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 07:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572419110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=ZYjavpYNdju7uQHCnPbWIWk6TuX9M9rpxBlmDPHLt1Y=;
	b=eWfcnH3AIyr84h82tMFsNCOH0RHN5+msjck3I2cSNjqNaUuIXdYHSsSm0qIQRDLpH0JfHL
	0yJBD2lNgLqKHmz324W/J18btM9rQHyY2LT91ciUQPudGb2zfceprc+st2ZplEcawbJ52p
	5oU1JVJRPg6V+MSHnbeHuRq6YrPe1lM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-82-OCSk8MvqNOiwx4R9AcJRYQ-1; Wed, 30 Oct 2019 03:05:06 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EDA0180496F;
	Wed, 30 Oct 2019 07:05:05 +0000 (UTC)
Received: from [10.72.12.223] (ovpn-12-223.pek2.redhat.com [10.72.12.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CC0210016EB;
	Wed, 30 Oct 2019 07:04:37 +0000 (UTC)
Subject: Re: [RFC] vhost_mdev: add network control vq support
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20191029101726.12699-1-tiwei.bie@intel.com>
	<59474431-9e77-567c-9a46-a3965f587f65@redhat.com>
	<20191030061711.GA11968@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <39aa9f66-8e58-ea63-5795-7df8861ff3a0@redhat.com>
Date: Wed, 30 Oct 2019 15:04:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191030061711.GA11968@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: OCSk8MvqNOiwx4R9AcJRYQ-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, lingshan.zhu@intel.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvMTAvMzAg5LiL5Y2IMjoxNywgVGl3ZWkgQmllIHdyb3RlOgo+IE9uIFR1ZSwgT2N0
IDI5LCAyMDE5IGF0IDA2OjUxOjMyUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+IE9uIDIw
MTkvMTAvMjkg5LiL5Y2INjoxNywgVGl3ZWkgQmllIHdyb3RlOgo+Pj4gVGhpcyBwYXRjaCBhZGRz
IHRoZSBuZXR3b3JrIGNvbnRyb2wgdnEgc3VwcG9ydCBpbiB2aG9zdC1tZGV2Lgo+Pj4gQSB2aG9z
dC1tZGV2IHNwZWNpZmljIG9wIGlzIGludHJvZHVjZWQgdG8gYWxsb3cgcGFyZW50IGRyaXZlcnMK
Pj4+IHRvIGhhbmRsZSB0aGUgbmV0d29yayBjb250cm9sIGNvbW1hbmRzIGNvbWUgZnJvbSB1c2Vy
c3BhY2UuCj4+IFByb2JhYmx5IHdvcmsgZm9yIHVzZXJzcGFjZSBkcml2ZXIgYnV0IG5vdCBrZXJu
ZWwgZHJpdmVyLgo+IEV4YWN0bHkuIFRoaXMgaXMgb25seSBmb3IgdXNlcnNwYWNlLgo+Cj4gSSBn
b3QgeW91ciBwb2ludCBub3cuIEluIHZpcnRpby1tZGV2IGtlcm5lbCBkcml2ZXIgY2FzZSwKPiB0
aGUgY3RybC12cSBjYW4gYmUgc3BlY2lhbCBhcyB3ZWxsLgo+CgpUaGVuIG1heWJlIGl0J3MgYmV0
dGVyIHRvIGludHJvZHVjZSB2aG9zdC1tZGV2LW5ldCBvbiB0b3A/CgpMb29raW5nIGF0IHRoZSBv
dGhlciB0eXBlIG9mIHZpcnRpbyBkZXZpY2U6CgotIGNvbnNvbGUgaGF2ZSB0d28gY29udHJvbCB2
aXJ0cXVldWVzIHdoZW4gbXVsdGlxdWV1ZSBwb3J0IGlzIGVuYWJsZWQKCi0gU0NTSSBoYXMgY29u
dHJvbHEgKyBldmVudHEKCi0gR1BVIGhhcyBjb250cm9scQoKLSBDcnlwdG8gZGV2aWNlIGhhcyBv
bmUgY29udHJvbHEKCi0gU29ja2V0IGhhcyBldmVudHEKCi4uLgoKVGhhbmtzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
