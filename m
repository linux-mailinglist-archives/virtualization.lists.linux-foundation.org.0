Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BF28E8F4CD
	for <lists.virtualization@lfdr.de>; Thu, 15 Aug 2019 21:38:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 618F11170;
	Thu, 15 Aug 2019 19:33:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B03B31164
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 19:33:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5583B89D
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 19:33:04 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l9so3561075qtu.6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 12:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=d/Vs2YH0f5xNou4jHOnIZOohEAfDIJUopBMHuRVrEaM=;
	b=DSQnzP2boVVz05frK9Rf9m+2jw7zFPx+9AUXj2jqSyufMDNrAKls4vo+Fb+WrAEgvO
	ktfk/TjL4ijraP2CEooza64EfLjaFdcqjeQ5Vv3suWLQE3AFJsd5YcPid89lanEu0ZoG
	VOQYC/bNeGf1IZi2CVdyacQhQw7JiSZnXckYhCGW/PB/p43g8HasbOXkyAfk/T5vpF3D
	xiyWjGC5nu7KpcLH5DDONB00uambPQIgUVk3jQbczWBzrPFHJZNpEMI+ZlEgjUg+75rH
	LjzpVx3i2jLsC6X0ifOF/LcBrXk/+s6IlAd5gRScNQG9jSmLI4mn6ct4mUNoFB6ybWFo
	/qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=d/Vs2YH0f5xNou4jHOnIZOohEAfDIJUopBMHuRVrEaM=;
	b=fGvVdYyfGck1xF06vbJyzpSQM/MwcOQpnP3yMBbXACOI4MIOMkp7G+zFG38oeXdgsm
	jBVh1r08McNItB9xmpVfRklToYuqIrCVTdGS8jahHnBFHG5LiBfJjvK6wW8vOo0sWUNc
	hSJm+6k+W8FGTyM3xIN+ykLP4BE/qllhQ+Zqiv63jMXtdUS0DapzqEULt0nz3EJDNt0o
	sLCaUVfF0Ftwm4Qa2/Woa7r3MdhvjXO//0Z+gPhxLa04QyJ+FITuH8Xf+5Y5ZNzlYcCy
	l18PB5Z1aJsxkLhAtT0F89Klm6QGPT3cD/taY2zcfIdIXCbSIAvuqQR3TTIxmJzjsxAc
	vC1Q==
X-Gm-Message-State: APjAAAX6v4AVk414/FSXRjGZ2EvN17ZUDwIcGe0c+bkytMUWJcdby0Ko
	iOFMmA7vcgzL3j8UwE4lSEi4jA==
X-Google-Smtp-Source: APXvYqzizPYl2LrtkxXjbmjRPnD30yqIwKDY6KgNsz0NbhIueWjJnIkysTmtYLAdQWA6iei+yUmzJQ==
X-Received: by 2002:ac8:5343:: with SMTP id d3mr5516461qto.50.1565897583402;
	Thu, 15 Aug 2019 12:33:03 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	s4sm1862094qkb.130.2019.08.15.12.33.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Aug 2019 12:33:03 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1hyLUc-0008Aa-AF; Thu, 15 Aug 2019 16:33:02 -0300
Date: Thu, 15 Aug 2019 16:33:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V5 0/9] Fixes for vhost metadata acceleration
Message-ID: <20190815193302.GT21596@ziepe.ca>
References: <20190809054851.20118-1-jasowang@redhat.com>
	<20190810134948-mutt-send-email-mst@kernel.org>
	<360a3b91-1ac5-84c0-d34b-a4243fa748c4@redhat.com>
	<20190812054429-mutt-send-email-mst@kernel.org>
	<20190812130252.GE24457@ziepe.ca>
	<9a9641fe-b48f-f32a-eecc-af9c2f4fbe0e@redhat.com>
	<20190813115707.GC29508@ziepe.ca>
	<74838e61-3a5e-0f51-2092-f4a16d144b45@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74838e61-3a5e-0f51-2092-f4a16d144b45@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTE6MjY6NDZBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzgvMTMg5LiL5Y2INzo1NywgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4gT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDQ6MzE6MDdQTSArMDgwMCwgSmFzb24gV2FuZyB3
cm90ZToKPiA+IAo+ID4gPiBXaGF0IGtpbmQgb2YgaXNzdWVzIGRvIHlvdSBzZWU/IFNwaW5sb2Nr
IGlzIHRvIHN5bmNocm9uaXplIEdVUCB3aXRoIE1NVQo+ID4gPiBub3RpZmllciBpbiB0aGlzIHNl
cmllcy4KPiA+IEEgR1VQIHRoYXQgY2FuJ3Qgc2xlZXAgY2FuJ3QgcGFnZWZhdWx0IHdoaWNoIG1h
a2VzIGl0IGEgcmVhbGx5IHdlaXJkCj4gPiBwYXR0ZXJuCj4gCj4gCj4gTXkgdW5kZXJzdGFuZGlu
ZyBpcyBfX2dldF91c2VyX3BhZ2VzX2Zhc3QoKSBhc3N1bWVzIGNhbGxlciBjYW4gZmFpbCBvciBo
YXZlCj4gZmFsbGJhY2suIEFuZCB3ZSBoYXZlIGdyYWNlZnVsIGZhbGxiYWNrIHRvIGNvcHlfe3Rv
fGZyb219X3VzZXIoKS4KCk15IHBvaW50IGlzIHRoYXQgaWYgeW91IGNhbiBmYWxsIGJhY2sgdG8g
Y29weV91c2VyIHRoZW4gaXQgaXMgd2VpcmQgdG8KY2FsbCB0aGUgc3BlY2lhbCBub24tc2xlZXBp
bmcgR1VQIHVuZGVyIGEgc3BpbmxvY2suCgpBRkFJSyB0aGUgb25seSByZWFzb24gdGhpcyBpcyBk
b25lIGlzIGJlY2F1c2Ugb2YgdGhlIHdheSB0aGUgbm90aWZpZXIKaXMgYmVpbmcgbG9ja2VkLi4u
CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
