Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6525520477B
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 04:51:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A05DC88BF6;
	Tue, 23 Jun 2020 02:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6aC4dO3wRvuc; Tue, 23 Jun 2020 02:51:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 19ACE88C1A;
	Tue, 23 Jun 2020 02:51:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE8C5C016F;
	Tue, 23 Jun 2020 02:51:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF285C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 02:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BC39087483
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 02:51:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U1-1dTHyhxPp
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 02:51:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7B1E987465
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 02:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592880704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wItOOFxGoX9Yxy2T8076N6nMJmnVQApKKEzZUpOJV/A=;
 b=g50VRCngZWLMIwYaxoUw1cF0OQuExnuv3lL6lSuUUSSy0E8oFxCTUQGZkH9e6YB/1xb4Gf
 OqxpHJmMA5DW0bR9ch03KsZagwI6I24YDRT1nFJaWlAgGknWQ5IZM4gswF6P31SIXq6vL/
 RWtsE1j3VpeQQC2uv1UtsDKSknWDhGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-IKRKNpSxMJyEL-9nTh0cCA-1; Mon, 22 Jun 2020 22:51:42 -0400
X-MC-Unique: IKRKNpSxMJyEL-9nTh0cCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2315EBFC1;
 Tue, 23 Jun 2020 02:51:41 +0000 (UTC)
Received: from [10.72.12.144] (ovpn-12-144.pek2.redhat.com [10.72.12.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2B9819D71;
 Tue, 23 Jun 2020 02:51:35 +0000 (UTC)
Subject: Re: [PATCH RFC v8 02/11] vhost: use batched get_vq_desc version
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200611113404.17810-1-mst@redhat.com>
 <20200611113404.17810-3-mst@redhat.com>
 <0332b0cf-cf00-9216-042c-e870efa33626@redhat.com>
 <20200622115946-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c56cc86d-a420-79ca-8420-e99db91980fa@redhat.com>
Date: Tue, 23 Jun 2020 10:51:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200622115946-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: netdev@vger.kernel.org, eperezma@redhat.com, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNi8yMyDkuIrljYgxMjowMCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IE9u
IFdlZCwgSnVuIDE3LCAyMDIwIGF0IDExOjE5OjI2QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4+IE9uIDIwMjAvNi8xMSDkuIvljYg3OjM0LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+
PiAgICBzdGF0aWMgdm9pZCB2aG9zdF92cV9mcmVlX2lvdmVjcyhzdHJ1Y3Qgdmhvc3RfdmlydHF1
ZXVlICp2cSkKPj4+ICAgIHsKPj4+ICAgIAlrZnJlZSh2cS0+ZGVzY3MpOwo+Pj4gQEAgLTM5NCw2
ICs0MDAsOSBAQCBzdGF0aWMgbG9uZyB2aG9zdF9kZXZfYWxsb2NfaW92ZWNzKHN0cnVjdCB2aG9z
dF9kZXYgKmRldikKPj4+ICAgIAlmb3IgKGkgPSAwOyBpIDwgZGV2LT5udnFzOyArK2kpIHsKPj4+
ICAgIAkJdnEgPSBkZXYtPnZxc1tpXTsKPj4+ICAgIAkJdnEtPm1heF9kZXNjcyA9IGRldi0+aW92
X2xpbWl0Owo+Pj4gKwkJaWYgKHZob3N0X3ZxX251bV9iYXRjaF9kZXNjcyh2cSkgPCAwKSB7Cj4+
PiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4+PiArCQl9Cj4+IFRoaXMgY2hlY2sgYnJlYWtzIHZkcGEg
d2hpY2ggc2V0IGlvdl9saW1pdCB0byB6ZXJvLiBDb25zaWRlciBpb3ZfbGltaXQgaXMKPj4gbWVh
bmluZ2xlc3MgdG8gdkRQQSwgSSB3b25kZXIgd2UgY2FuIHNraXAgdGhlIHRlc3Qgd2hlbiBkZXZp
Y2UgZG9lc24ndCB1c2UKPj4gd29ya2VyLgo+Pgo+PiBUaGFua3MKPiBJdCBkb2Vzbid0IG5lZWQg
aW92ZWNzIGF0IGFsbCwgcmlnaHQ/Cj4KPiAtLSBNU1QKCgpZZXMsIHNvIHdlIG1heSBjaG9vc2Ug
dG8gYnlwYXNzIHRoZSBpb3ZlY3MgYXMgd2VsbC4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
