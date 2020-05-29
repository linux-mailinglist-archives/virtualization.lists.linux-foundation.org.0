Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEE81E7659
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 09:07:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AFEF1881BF;
	Fri, 29 May 2020 07:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nl4vMSsC04ZQ; Fri, 29 May 2020 07:07:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A00C88126;
	Fri, 29 May 2020 07:07:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6E33C016F;
	Fri, 29 May 2020 07:07:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0D98C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AC60E87063
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AG6KTCgqO9Mb
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:07:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A8EFF87382
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590736034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pivs+3xvqdIzBjxHwsCy4HZnB3ZGTtO9uNfpkTxvtC8=;
 b=HGAlajvQ1cSdagzxPjaXS7AF9C/5ZCl4z7M8s1Szu866buLh30Dmb8eDUEieL+BTfXoxgA
 frL5zLV+lFd9msLx3xi8gVRXYHlkqEFC8KzJxVl2NWAGfcOqr73vm4UpbYyC0tG8is1Eyp
 15OwcxV5ghzjoHfsUtBVjKthiuygkTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-TiDOx8SSMxmL--eQ7_cUyA-1; Fri, 29 May 2020 03:07:10 -0400
X-MC-Unique: TiDOx8SSMxmL--eQ7_cUyA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACA768015D1;
 Fri, 29 May 2020 07:07:08 +0000 (UTC)
Received: from [10.72.13.231] (ovpn-13-231.pek2.redhat.com [10.72.13.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98A7A579A5;
 Fri, 29 May 2020 07:07:01 +0000 (UTC)
Subject: Re: [PATCH v3 0/5] Add a vhost RPMsg API
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <044a3b81-e0fd-5d96-80ff-b13e587f9d39@redhat.com>
 <20200529065050.GA6002@ubuntu>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <327003ea-2bea-0c13-74cd-fa8bce7386f4@redhat.com>
Date: Fri, 29 May 2020 15:06:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200529065050.GA6002@ubuntu>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-remoteproc@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 sound-open-firmware@alsa-project.org
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

Ck9uIDIwMjAvNS8yOSDkuIvljYgyOjUwLCBHdWVubmFkaSBMaWFraG92ZXRza2kgd3JvdGU6Cj4g
SGkgSmFzb24sCj4KPiBPbiBGcmksIE1heSAyOSwgMjAyMCBhdCAwMjowMTo1M1BNICswODAwLCBK
YXNvbiBXYW5nIHdyb3RlOgo+PiBPbiAyMDIwLzUvMjgg5LiK5Y2IMjowNSwgR3Vlbm5hZGkgTGlh
a2hvdmV0c2tpIHdyb3RlOgo+Pj4gdjM6Cj4+PiAtIGFkZHJlc3Mgc2V2ZXJhbCBjaGVja3BhdGNo
IHdhcm5pbmdzCj4+PiAtIGFkZHJlc3MgY29tbWVudHMgZnJvbSBNYXRoaWV1IFBvaXJpZXIKPj4+
Cj4+PiB2MjoKPj4+IC0gdXBkYXRlIHBhdGNoICM1IHdpdGggYSBjb3JyZWN0IHZob3N0X2Rldl9p
bml0KCkgcHJvdG90eXBlCj4+PiAtIGRyb3AgcGF0Y2ggIzYgLSBpdCBkZXBlbmRzIG9uIGEgZGlm
ZmVyZW50IHBhdGNoLCB0aGF0IGlzIGN1cnJlbnRseQo+Pj4gICAgIGFuIFJGQwo+Pj4gLSBhZGRy
ZXNzIGNvbW1lbnRzIGZyb20gUGllcnJlLUxvdWlzIEJvc3NhcnQ6Cj4+PiAgICAgKiByZW1vdmUg
ImRlZmF1bHQgbiIgZnJvbSBLY29uZmlnCj4+Pgo+Pj4gTGludXggc3VwcG9ydHMgUlBNc2cgb3Zl
ciBWaXJ0SU8gZm9yICJyZW1vdGUgcHJvY2Vzc29yIiAvQU1QIHVzZQo+Pj4gY2FzZXMuIEl0IGNh
biBob3dldmVyIGFsc28gYmUgdXNlZCBmb3IgdmlydHVhbGlzYXRpb24gc2NlbmFyaW9zLAo+Pj4g
ZS5nLiB3aGVuIHVzaW5nIEtWTSB0byBydW4gTGludXggb24gYm90aCB0aGUgaG9zdCBhbmQgdGhl
IGd1ZXN0cy4KPj4+IFRoaXMgcGF0Y2ggc2V0IGFkZHMgYSB3cmFwcGVyIEFQSSB0byBmYWNpbGl0
YXRlIHdyaXRpbmcgdmhvc3QKPj4+IGRyaXZlcnMgZm9yIHN1Y2ggUlBNc2ctYmFzZWQgc29sdXRp
b25zLiBUaGUgZmlyc3QgdXNlIGNhc2UgaXMgYW4KPj4+IGF1ZGlvIERTUCB2aXJ0dWFsaXNhdGlv
biBwcm9qZWN0LCBjdXJyZW50bHkgdW5kZXIgZGV2ZWxvcG1lbnQsIHJlYWR5Cj4+PiBmb3IgcmV2
aWV3IGFuZCBzdWJtaXNzaW9uLCBhdmFpbGFibGUgYXQKPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS90
aGVzb2Zwcm9qZWN0L2xpbnV4L3B1bGwvMTUwMS9jb21taXRzCj4+PiBBIGZ1cnRoZXIgcGF0Y2gg
Zm9yIHRoZSBBRFNQIHZob3N0IFJQTXNnIGRyaXZlciB3aWxsIGJlIHNlbnQKPj4+IHNlcGFyYXRl
bHkgZm9yIHJldmlldyBvbmx5IHNpbmNlIGl0IGNhbm5vdCBiZSBtZXJnZWQgd2l0aG91dCBhdWRp
bwo+Pj4gcGF0Y2hlcyBiZWluZyB1cHN0cmVhbWVkIGZpcnN0Lgo+Pgo+PiBIaToKPj4KPj4gSXQg
d291bGQgYmUgaGFyZCB0byBldmFsdWF0ZSB0aGlzIHNlcmllcyB3aXRob3V0IGEgcmVhbCB1c2Vy
LiBTbyBpZgo+PiBwb3NzaWJsZSwgSSBzdWdnZXN0IHRvIHBvc3QgdGhlIGFjdHVhbCB1c2VyIGZv
ciB2aG9zdCBycG1zZyBBUEkuCj4gU3VyZSwgdGhlIHdob2xlIHNlcmllcyBpcyBhdmFpbGFibGUg
YXQKPiBodHRwczovL2dpdGh1Yi5jb20vdGhlc29mcHJvamVjdC9saW51eC9wdWxsLzE1MDEvY29t
bWl0cyBvciB3b3VsZCB5b3UKPiBwcmVmZXIgdGhlIG1pc3NpbmcgcGF0Y2hlcyBwb3N0ZWQgdG8g
dGhlIGxpc3RzIHRvbz8KCgpZZXMsIHNpbmNlIEkgc2VlIG5ldyB2aXJ0aW8gYW5kIHZob3N0IGRy
aXZlcnMgdGhlcmUuCgpUaGFua3MKCgo+Cj4gVGhhbmtzCj4gR3Vlbm5hZGkKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
