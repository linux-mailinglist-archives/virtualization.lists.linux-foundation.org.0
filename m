Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EF11EE105
	for <lists.virtualization@lfdr.de>; Thu,  4 Jun 2020 11:18:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C785186EEB;
	Thu,  4 Jun 2020 09:18:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24qQDoItjtNd; Thu,  4 Jun 2020 09:18:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 59F4D86EDB;
	Thu,  4 Jun 2020 09:18:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27FF4C016E;
	Thu,  4 Jun 2020 09:18:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65224C016E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 09:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4C04386EB7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 09:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9_dultLBfIJB
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 09:18:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 87A1986EB3
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 09:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591262292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VKRvnA2ntagIiR78RlbOmGx0PU/n/EP0BCi9aIW6b1E=;
 b=Pys6LcCCTdFHzl7/4VM19JGr738AfiScHClNzK8F18cx7LoiiyEzYRLToBdiNEseGA43SC
 W5m6mYKN2YWwbSYBNUwD/2s2Xzy7pE9ag4Iv+ARtpUhGTQDHRck8qyGc9Y7ao0AGM2lON7
 v5O7d+BT3lMjopysOvpieNknnX53Sjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-2rCnZHGmOECqZrGO79PghQ-1; Thu, 04 Jun 2020 05:18:10 -0400
X-MC-Unique: 2rCnZHGmOECqZrGO79PghQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80BD9107ACF3;
 Thu,  4 Jun 2020 09:18:09 +0000 (UTC)
Received: from [10.72.13.104] (ovpn-13-104.pek2.redhat.com [10.72.13.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C943160CD1;
 Thu,  4 Jun 2020 09:18:01 +0000 (UTC)
Subject: Re: [PATCH RFC 07/13] vhost: format-independent API for used buffers
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200602130543.578420-1-mst@redhat.com>
 <20200602130543.578420-8-mst@redhat.com>
 <6d98f2cc-2084-cde0-c938-4ca01692adf9@redhat.com>
 <20200604050135-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b39e6fb8-a59a-2b3f-a1eb-1ccea2fe1b86@redhat.com>
Date: Thu, 4 Jun 2020 17:18:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200604050135-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNi80IOS4i+WNiDU6MDMsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+ICAg
IHN0YXRpYyBib29sIHZob3N0X25vdGlmeShzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsIHN0cnVjdCB2
aG9zdF92aXJ0cXVldWUgKnZxKQo+Pj4gICAgewo+Pj4gICAgCV9fdTE2IG9sZCwgbmV3Owo+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaCBiL2RyaXZlcnMvdmhvc3Qvdmhvc3Qu
aAo+Pj4gaW5kZXggYTY3YmRhOTc5MmVjLi42YzEwZTk5ZmYzMzQgMTAwNjQ0Cj4+PiAtLS0gYS9k
cml2ZXJzL3Zob3N0L3Zob3N0LmgKPj4+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaAo+Pj4g
QEAgLTY3LDYgKzY3LDEzIEBAIHN0cnVjdCB2aG9zdF9kZXNjIHsKPj4+ICAgIAl1MTYgaWQ7Cj4+
PiAgICB9Owo+Pj4gK3N0cnVjdCB2aG9zdF9idWYgewo+Pj4gKwl1MzIgb3V0X2xlbjsKPj4+ICsJ
dTMyIGluX2xlbjsKPj4+ICsJdTE2IGRlc2NzOwo+Pj4gKwl1MTYgaWQ7Cj4+PiArfTsKPj4gU28g
aXQgbG9va3MgdG8gbWUgdGhlIHN0cnVjdCB2aG9zdF9idWYgY2FuIHdvcmsgZm9yIGJvdGggc3Bs
aXQgcmluZyBhbmQKPj4gcGFja2VkIHJpbmcuCj4+Cj4+IElmIHRoaXMgaXMgdHJ1ZSwgd2UnZCBi
ZXR0ZXIgbWFrZSBzdHJ1Y3Qgdmhvc3RfZGVzYyB3b3JrIGZvciBib3RoLgo+Pgo+PiBUaGFua3MK
PiBCb3RoIHZob3N0X2Rlc2MgYW5kIHZob3N0X2J1ZiBjYW4gd29yayBmb3Igc3BsaXQgYW5kIHBh
Y2tlZC4KPgo+IERvIHlvdSBtZWFuIHdlIHNob3VsZCBhZGQgcGFja2VkIHJpbmcgc3VwcG9ydCBi
YXNlZCBvbiB0aGlzPwo+IEZvciBzdXJlLCB0aGlzIGlzIG9uZSBvZiB0aGUgbW90aXZhdG9ycyBm
b3IgdGhlIHBhdGNoc2V0Lgo+CgpTb21laG93LiBCdXQgdGhlIHJlYXNvbiBJIGFzayBpcyB0aGF0
IEkgc2VlICJzcGxpdCIgc3VmZml4IGlzIHVzZWQgaW4gCnBhdGNoIDEgYXM6CgpwZWVrX3NwbGl0
X2Rlc2MoKQpwb3Bfc3BsaXRfZGVzYygpCnB1c2hfc3BsaXRfZGVzYygpCgpCdXQgdGhhdCBzdWZm
aXggaXMgbm90IHVzZWQgZm9yIHRoZSBuZXcgdXNlZCByaW5nIEFQSSBpbnZlbnRlZCBpbiB0aGlz
IApwYXRjaC4KClRoYW5rcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
