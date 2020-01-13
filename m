Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9732B138FC7
	for <lists.virtualization@lfdr.de>; Mon, 13 Jan 2020 12:08:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0CDA485754;
	Mon, 13 Jan 2020 11:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 40RYIC7IWceC; Mon, 13 Jan 2020 11:08:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 844618574F;
	Mon, 13 Jan 2020 11:08:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BC89C077D;
	Mon, 13 Jan 2020 11:08:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 759A4C077D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 11:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4B18886D73
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 11:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RA2rGtQk7xKW
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 11:08:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2F3E386CD7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 11:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578913689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHUwvC4V45pQBl3YOQgs1FSsgQ9Xms/WHSg7K9Kokh4=;
 b=PFlySBzNlddNl4bvhL7gCsjzSsG3OUUrHeoi+4h6elrBfTb7+0GQyDhfaYqyxG/wa0QkQP
 uCeblRKfhvVBzp3aslpM6TR6/U8HqYk+0JkVPh+pj8oUdgJkZu0ys+XmO28ars5LV/9HKy
 lFBUmwfBchBtXxho4kGskzKaN0vdwdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-HyVeANQYPxm5Op4tY6G7AQ-1; Mon, 13 Jan 2020 06:08:06 -0500
X-MC-Unique: HyVeANQYPxm5Op4tY6G7AQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B7BB1005514;
 Mon, 13 Jan 2020 11:08:05 +0000 (UTC)
Received: from [10.72.12.51] (ovpn-12-51.pek2.redhat.com [10.72.12.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 209CE5C1BB;
 Mon, 13 Jan 2020 11:07:57 +0000 (UTC)
Subject: Re: [PATCH v2] virtio-net: Introduce extended RSC feature
To: Yuri Benditovich <yuri.benditovich@daynix.com>, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200113081736.2340-1-yuri.benditovich@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bdc6cb05-30d1-b4fd-512e-740b2550c14e@redhat.com>
Date: Mon, 13 Jan 2020 19:07:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200113081736.2340-1-yuri.benditovich@daynix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: yan@daynix.com
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

Ck9uIDIwMjAvMS8xMyDkuIvljYg0OjE3LCBZdXJpIEJlbmRpdG92aWNoIHdyb3RlOgo+IFZJUlRJ
T19ORVRfRl9SU0NfRVhUIGZlYXR1cmUgYml0IGluZGljYXRlcyB0aGF0IHRoZSBkZXZpY2UKPiBp
cyBhYmxlIHRvIHByb3ZpZGUgZXh0ZW5kZWQgUlNDIGluZm9ybWF0aW9uLiBXaGVuIHRoZSBmZWF0
dXJlCj4gaXMgbmVnb3RpYXRlZGUgYW5kICdnc29fdHlwZScgZmllbGQgaW4gcmVjZWl2ZWQgcGFj
a2V0IGlzIG5vdAo+IEdTT19OT05FLCB0aGUgZGV2aWNlIHJlcG9ydHMgbnVtYmVyIG9mIGNvYWxl
c2NlZCBwYWNrZXRzIGluCj4gJ2NzdW1fc3RhcnQnIGZpZWxkIGFuZCBudW1iZXIgb2YgZHVwbGlj
YXRlZCBhY2tzIGluICdjc3VtX29mZnNldCcKPiBmaWVsZCBhbmQgc2V0cyBWSVJUSU9fTkVUX0hE
Ul9GX1JTQ19JTkZPIGluICdmbGFncycgZmllbGQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdXJpIEJl
bmRpdG92aWNoIDx5dXJpLmJlbmRpdG92aWNoQGRheW5peC5jb20+CgoKSGkgWXVyaToKCklzIHRo
ZSBmZWF0dXJlIHVzZWQgYnkgTGludXg/IElmIHllcywgaXQncyBiZXR0ZXIgdG8gaW5jbHVkZSB0
aGUgcmVhbCB1c2VyLgoKCj4gLS0tCj4gICBpbmNsdWRlL3VhcGkvbGludXgvdmlydGlvX25ldC5o
IHwgMTAgKysrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9fbmV0
LmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmlydGlvX25ldC5oCj4gaW5kZXggYTM3MTVhMzIyNGMx
Li4yYmRkMjZmOGE0ZWQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19u
ZXQuaAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9fbmV0LmgKPiBAQCAtNTYsNyAr
NTYsNyBAQAo+ICAgI2RlZmluZSBWSVJUSU9fTkVUX0ZfTVEJMjIJLyogRGV2aWNlIHN1cHBvcnRz
IFJlY2VpdmUgRmxvdwo+ICAgCQkJCQkgKiBTdGVlcmluZyAqLwo+ICAgI2RlZmluZSBWSVJUSU9f
TkVUX0ZfQ1RSTF9NQUNfQUREUiAyMwkvKiBTZXQgTUFDIGFkZHJlc3MgKi8KPiAtCj4gKyNkZWZp
bmUgVklSVElPX05FVF9GX1JTQ19FWFQJICA2MQkvKiBQcm92aWRlcyBleHRlbmRlZCBSU0MgaW5m
byAqLwoKCklzIHRoaXMgYmV0dGVyIHRvIGtlZXAgdGhlIG5ld2xpbmUgYXJvdW5kPwoKCj4gICAj
ZGVmaW5lIFZJUlRJT19ORVRfRl9TVEFOREJZCSAgNjIJLyogQWN0IGFzIHN0YW5kYnkgZm9yIGFu
b3RoZXIgZGV2aWNlCj4gICAJCQkJCSAqIHdpdGggdGhlIHNhbWUgTUFDLgo+ICAgCQkJCQkgKi8K
PiBAQCAtMTA0LDYgKzEwNCw3IEBAIHN0cnVjdCB2aXJ0aW9fbmV0X2NvbmZpZyB7Cj4gICBzdHJ1
Y3QgdmlydGlvX25ldF9oZHJfdjEgewo+ICAgI2RlZmluZSBWSVJUSU9fTkVUX0hEUl9GX05FRURT
X0NTVU0JMQkvKiBVc2UgY3N1bV9zdGFydCwgY3N1bV9vZmZzZXQgKi8KPiAgICNkZWZpbmUgVklS
VElPX05FVF9IRFJfRl9EQVRBX1ZBTElECTIJLyogQ3N1bSBpcyB2YWxpZCAqLwo+ICsjZGVmaW5l
IFZJUlRJT19ORVRfSERSX0ZfUlNDX0lORk8JNAkvKiByc2NfZXh0IGRhdGEgaW4gY3N1bV8gZmll
bGRzICovCj4gICAJX191OCBmbGFnczsKPiAgICNkZWZpbmUgVklSVElPX05FVF9IRFJfR1NPX05P
TkUJCTAJLyogTm90IGEgR1NPIGZyYW1lICovCj4gICAjZGVmaW5lIFZJUlRJT19ORVRfSERSX0dT
T19UQ1BWNAkxCS8qIEdTTyBmcmFtZSwgSVB2NCBUQ1AgKFRTTykgKi8KPiBAQCAtMTE4LDYgKzEx
OSwxMyBAQCBzdHJ1Y3QgdmlydGlvX25ldF9oZHJfdjEgewo+ICAgCV9fdmlydGlvMTYgbnVtX2J1
ZmZlcnM7CS8qIE51bWJlciBvZiBtZXJnZWQgcnggYnVmZmVycyAqLwo+ICAgfTsKPiAgIAo+ICsv
Kgo+ICsgKiBpZiBWSVJUSU9fTkVUX0ZfUlNDX0VYVCBmZWF0dXJlIGhhcyBiZWVuIG5lZ290aWF0
ZWQgYW5kCj4gKyAqIFZJUlRJT19ORVRfSERSX0ZfUlNDX0lORk8gaXMgc2V0IGluIFJYIHBhY2tl
dAo+ICsgKi8KPiArI2RlZmluZSB2aXJ0aW9fbmV0X3JzY19leHRfbnVtX3BhY2tldHMJY3N1bV9z
dGFydAo+ICsjZGVmaW5lIHZpcnRpb19uZXRfcnNjX2V4dF9udW1fZHVwYWNrcwljc3VtX29mZnNl
dAoKClRoaXMgbG9va3Mgc3ViLW9wdGltYWwsIGl0IGxvb2tzIHRvIG1lIHVuaW9uIGlzIGJldHRl
cj8KClRoYW5rcwoKCj4gKwo+ICAgI2lmbmRlZiBWSVJUSU9fTkVUX05PX0xFR0FDWQo+ICAgLyog
VGhpcyBoZWFkZXIgY29tZXMgZmlyc3QgaW4gdGhlIHNjYXR0ZXItZ2F0aGVyIGxpc3QuCj4gICAg
KiBGb3IgbGVnYWN5IHZpcnRpbywgaWYgVklSVElPX0ZfQU5ZX0xBWU9VVCBpcyBub3QgbmVnb3Rp
YXRlZCwgaXQgbXVzdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
