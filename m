Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 028721E75BD
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 08:02:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AC65A87383;
	Fri, 29 May 2020 06:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XzBEM1iAByKw; Fri, 29 May 2020 06:02:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 471FD8737E;
	Fri, 29 May 2020 06:02:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 155BDC016F;
	Fri, 29 May 2020 06:02:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A61FC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 06:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 793C82155E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 06:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnnlRuRVqOt6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 06:02:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id E1AF025CA8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 06:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590732127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffiZE6g18lngbbpjo1gUPeKuc7C2D+JU9iaxsPoeJj8=;
 b=HP/Hr9Tazy/MZxV67qQr34JMcpq4erwjk+1a3j+sVgLTURXgdrZM4CecwiQUpLYDpvJ3DY
 YRIxn7jnk5FvbIDPLPF7eFI2cShfREnBx1E02DTbTtQurfIrhl9/NkSkVK1re5yOpe9JQz
 Eu0WeQQF4LpbmwUjkkL5rbq21J0FAU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-6lfzZSWOMTejw0vtJNWU-w-1; Fri, 29 May 2020 02:02:03 -0400
X-MC-Unique: 6lfzZSWOMTejw0vtJNWU-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E2E9460;
 Fri, 29 May 2020 06:02:02 +0000 (UTC)
Received: from [10.72.13.231] (ovpn-13-231.pek2.redhat.com [10.72.13.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F68210013DB;
 Fri, 29 May 2020 06:01:54 +0000 (UTC)
Subject: Re: [PATCH v3 0/5] Add a vhost RPMsg API
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kvm@vger.kernel.org
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <044a3b81-e0fd-5d96-80ff-b13e587f9d39@redhat.com>
Date: Fri, 29 May 2020 14:01:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
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

Ck9uIDIwMjAvNS8yOCDkuIrljYgyOjA1LCBHdWVubmFkaSBMaWFraG92ZXRza2kgd3JvdGU6Cj4g
djM6Cj4gLSBhZGRyZXNzIHNldmVyYWwgY2hlY2twYXRjaCB3YXJuaW5ncwo+IC0gYWRkcmVzcyBj
b21tZW50cyBmcm9tIE1hdGhpZXUgUG9pcmllcgo+Cj4gdjI6Cj4gLSB1cGRhdGUgcGF0Y2ggIzUg
d2l0aCBhIGNvcnJlY3Qgdmhvc3RfZGV2X2luaXQoKSBwcm90b3R5cGUKPiAtIGRyb3AgcGF0Y2gg
IzYgLSBpdCBkZXBlbmRzIG9uIGEgZGlmZmVyZW50IHBhdGNoLCB0aGF0IGlzIGN1cnJlbnRseQo+
ICAgIGFuIFJGQwo+IC0gYWRkcmVzcyBjb21tZW50cyBmcm9tIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0
Ogo+ICAgICogcmVtb3ZlICJkZWZhdWx0IG4iIGZyb20gS2NvbmZpZwo+Cj4gTGludXggc3VwcG9y
dHMgUlBNc2cgb3ZlciBWaXJ0SU8gZm9yICJyZW1vdGUgcHJvY2Vzc29yIiAvQU1QIHVzZQo+IGNh
c2VzLiBJdCBjYW4gaG93ZXZlciBhbHNvIGJlIHVzZWQgZm9yIHZpcnR1YWxpc2F0aW9uIHNjZW5h
cmlvcywKPiBlLmcuIHdoZW4gdXNpbmcgS1ZNIHRvIHJ1biBMaW51eCBvbiBib3RoIHRoZSBob3N0
IGFuZCB0aGUgZ3Vlc3RzLgo+IFRoaXMgcGF0Y2ggc2V0IGFkZHMgYSB3cmFwcGVyIEFQSSB0byBm
YWNpbGl0YXRlIHdyaXRpbmcgdmhvc3QKPiBkcml2ZXJzIGZvciBzdWNoIFJQTXNnLWJhc2VkIHNv
bHV0aW9ucy4gVGhlIGZpcnN0IHVzZSBjYXNlIGlzIGFuCj4gYXVkaW8gRFNQIHZpcnR1YWxpc2F0
aW9uIHByb2plY3QsIGN1cnJlbnRseSB1bmRlciBkZXZlbG9wbWVudCwgcmVhZHkKPiBmb3IgcmV2
aWV3IGFuZCBzdWJtaXNzaW9uLCBhdmFpbGFibGUgYXQKPiBodHRwczovL2dpdGh1Yi5jb20vdGhl
c29mcHJvamVjdC9saW51eC9wdWxsLzE1MDEvY29tbWl0cwo+IEEgZnVydGhlciBwYXRjaCBmb3Ig
dGhlIEFEU1Agdmhvc3QgUlBNc2cgZHJpdmVyIHdpbGwgYmUgc2VudAo+IHNlcGFyYXRlbHkgZm9y
IHJldmlldyBvbmx5IHNpbmNlIGl0IGNhbm5vdCBiZSBtZXJnZWQgd2l0aG91dCBhdWRpbwo+IHBh
dGNoZXMgYmVpbmcgdXBzdHJlYW1lZCBmaXJzdC4KCgpIaToKCkl0IHdvdWxkIGJlIGhhcmQgdG8g
ZXZhbHVhdGUgdGhpcyBzZXJpZXMgd2l0aG91dCBhIHJlYWwgdXNlci4gU28gaWYgCnBvc3NpYmxl
LCBJIHN1Z2dlc3QgdG8gcG9zdCB0aGUgYWN0dWFsIHVzZXIgZm9yIHZob3N0IHJwbXNnIEFQSS4K
ClRoYW5rcwoKCj4KPiBUaGFua3MKPiBHdWVubmFkaQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1
YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
