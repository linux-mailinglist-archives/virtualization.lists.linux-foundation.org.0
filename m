Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A38B2220C27
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 13:51:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 577E88ABD1;
	Wed, 15 Jul 2020 11:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VDF-KrMt8BRC; Wed, 15 Jul 2020 11:51:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BD62C8A983;
	Wed, 15 Jul 2020 11:51:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C02CC0733;
	Wed, 15 Jul 2020 11:51:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE5B3C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 11:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C219A2048A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 11:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RxIapDlsEWws
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 11:51:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 8807220488
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 11:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594813900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r3FX3UuRCTo9UAVThurv1D/BIiQ0N6rOrGTWl0O4StY=;
 b=KHgHXwZZWQ1WGaEYIs22aXYd2y/x6+opsm2IogAPASr2BcfHPI/s58cUaLlRjuNegmxZb7
 aOq+BmDuku/cJ1MFjd+ukGUL7kx1snIHA5poLBRqSV+13BDTy8+eTGqr9wQNKjJmNiCmgV
 2Etu+hUMe7jkzy1rhhCK+LjjG/gv9Jg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-iOH8M9OQMS-rcyR5HGrLCw-1; Wed, 15 Jul 2020 07:51:36 -0400
X-MC-Unique: iOH8M9OQMS-rcyR5HGrLCw-1
Received: by mail-qk1-f199.google.com with SMTP id j79so1308268qke.5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 04:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=r3FX3UuRCTo9UAVThurv1D/BIiQ0N6rOrGTWl0O4StY=;
 b=gTzcnoHVmgKV++fO42REPNaRcGEyOYRZWwZrP/tfWnx0NB9NVegFgQHC6qqPkBxXsy
 hZJtNsWuJMUu6x4xce7t3oGXr1Y1xnvWRx7ZOo5av5lv2nTxm1F3Tl8Y6pIAZVxKWRxn
 IK/LmqShBug4ZNLBZYN+Ol2kIa51R/9FdKGbqWKea003cYTTKb1JAS1LB4YUPQPzLIGT
 l1JN69+qPx6VDrUtX9EL4fhhj1J726TtHwhXkxrqBS1NBrpqvd2owPDFfJhNwULzRtpf
 kPDjyUeKlF0NP79dG3ohu6wH0lD3A5A+/P5cNylNROZkhXv0QSpG0ATKR9+bOuU2wanv
 sKJA==
X-Gm-Message-State: AOAM532XZDiSlCP5MfEJUzuCM/xKXkjLL6WLRs3QY6NC+WTboiEqVvBI
 qjleb3In/BuKgy8BN6ffTp1MHJBWF/QO0m97v0gA2uNq/fG6U2ILSzRwTn+HmJnu+DEzKtgZtp8
 bFCMsZ6Usw/+ZX/PS3IgQ7NS8zsZrWh7h1mORBBre5g==
X-Received: by 2002:a37:4249:: with SMTP id p70mr8978826qka.496.1594813895587; 
 Wed, 15 Jul 2020 04:51:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx1aUJiCqHYur0Jh6ZYxhkiq8X5xdMXXfCrNDK8eHV+0xFXx7Y6LeDlwk29NTSE0FYz2C5zw==
X-Received: by 2002:a37:4249:: with SMTP id p70mr8978802qka.496.1594813895270; 
 Wed, 15 Jul 2020 04:51:35 -0700 (PDT)
Received: from redhat.com (bzq-79-180-10-140.red.bezeqint.net. [79.180.10.140])
 by smtp.gmail.com with ESMTPSA id n64sm2006264qke.77.2020.07.15.04.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 04:51:34 -0700 (PDT)
Date: Wed, 15 Jul 2020 07:51:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v7 2/2] s390: virtio: PV needs VIRTIO I/O device protection
Message-ID: <20200715074917-mutt-send-email-mst@kernel.org>
References: <1594801869-13365-1-git-send-email-pmorel@linux.ibm.com>
 <1594801869-13365-3-git-send-email-pmorel@linux.ibm.com>
 <20200715054807-mutt-send-email-mst@kernel.org>
 <bc5e09ad-faaf-8b38-83e0-5f4a4b1daeb0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bc5e09ad-faaf-8b38-83e0-5f4a4b1daeb0@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 Pierre Morel <pmorel@linux.ibm.com>, thomas.lendacky@amd.com,
 hca@linux.ibm.com, cohuck@redhat.com, linuxram@us.ibm.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, kvm@vger.kernel.org,
 david@gibson.dropbear.id.au
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gV2VkLCBKdWwgMTUsIDIwMjAgYXQgMDY6MTY6NTlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzcvMTUg5LiL5Y2INTo1MCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gV2VkLCBKdWwgMTUsIDIwMjAgYXQgMTA6MzE6MDlBTSArMDIwMCwgUGllcnJlIE1v
cmVsIHdyb3RlOgo+ID4gPiBJZiBwcm90ZWN0ZWQgdmlydHVhbGl6YXRpb24gaXMgYWN0aXZlIG9u
IHMzOTAsIHRoZSB2aXJ0aW8gcXVldWVzIGFyZQo+ID4gPiBub3QgYWNjZXNzaWJsZSB0byB0aGUg
aG9zdCwgdW5sZXNzIFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNIGhhcyBiZWVuCj4gPiA+IG5lZ290
aWF0ZWQuIFVzZSB0aGUgbmV3IGFyY2hfdmFsaWRhdGVfdmlydGlvX2ZlYXR1cmVzKCkgaW50ZXJm
YWNlIHRvCj4gPiA+IGZhaWwgcHJvYmUgaWYgdGhhdCdzIG5vdCB0aGUgY2FzZSwgcHJldmVudGlu
ZyBhIGhvc3QgZXJyb3Igb24gYWNjZXNzCj4gPiA+IGF0dGVtcHQuCj4gPiA+IAo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBQaWVycmUgTW9yZWwgPHBtb3JlbEBsaW51eC5pYm0uY29tPgo+ID4gPiBSZXZp
ZXdlZC1ieTogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+Cj4gPiA+IEFja2VkLWJ5
OiBIYWxpbCBQYXNpYyA8cGFzaWNAbGludXguaWJtLmNvbT4KPiA+ID4gQWNrZWQtYnk6IENocmlz
dGlhbiBCb3JudHJhZWdlciA8Ym9ybnRyYWVnZXJAZGUuaWJtLmNvbT4KPiA+ID4gLS0tCj4gPiA+
ICAgYXJjaC9zMzkwL21tL2luaXQuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvczM5MC9tbS9pbml0LmMgYi9hcmNoL3MzOTAvbW0vaW5pdC5jCj4gPiA+
IGluZGV4IDZkYzdjM2I2MGVmNi4uZDM5YWY2NTU0ZDRmIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNo
L3MzOTAvbW0vaW5pdC5jCj4gPiA+ICsrKyBiL2FyY2gvczM5MC9tbS9pbml0LmMKPiA+ID4gQEAg
LTQ1LDYgKzQ1LDcgQEAKPiA+ID4gICAjaW5jbHVkZSA8YXNtL2thc2FuLmg+Cj4gPiA+ICAgI2lu
Y2x1ZGUgPGFzbS9kbWEtbWFwcGluZy5oPgo+ID4gPiAgICNpbmNsdWRlIDxhc20vdXYuaD4KPiA+
ID4gKyNpbmNsdWRlIDxsaW51eC92aXJ0aW9fY29uZmlnLmg+Cj4gPiA+ICAgcGdkX3Qgc3dhcHBl
cl9wZ19kaXJbUFRSU19QRVJfUEdEXSBfX3NlY3Rpb24oLmJzcy4uc3dhcHBlcl9wZ19kaXIpOwo+
ID4gPiBAQCAtMTYxLDYgKzE2MiwzMyBAQCBib29sIGZvcmNlX2RtYV91bmVuY3J5cHRlZChzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gPiA+ICAgCXJldHVybiBpc19wcm90X3ZpcnRfZ3Vlc3QoKTsKPiA+
ID4gICB9Cj4gPiA+ICsvKgo+ID4gPiArICogYXJjaF92YWxpZGF0ZV92aXJ0aW9fZmVhdHVyZXMK
PiA+ID4gKyAqIEBkZXY6IHRoZSBWSVJUSU8gZGV2aWNlIGJlaW5nIGFkZGVkCj4gPiA+ICsgKgo+
ID4gPiArICogUmV0dXJuIGFuIGVycm9yIGlmIHJlcXVpcmVkIGZlYXR1cmVzIGFyZSBtaXNzaW5n
IG9uIGEgZ3Vlc3QgcnVubmluZwo+ID4gPiArICogd2l0aCBwcm90ZWN0ZWQgdmlydHVhbGl6YXRp
b24uCj4gPiA+ICsgKi8KPiA+ID4gK2ludCBhcmNoX3ZhbGlkYXRlX3ZpcnRpb19mZWF0dXJlcyhz
dHJ1Y3QgdmlydGlvX2RldmljZSAqZGV2KQo+ID4gPiArewo+ID4gPiArCWlmICghaXNfcHJvdF92
aXJ0X2d1ZXN0KCkpCj4gPiA+ICsJCXJldHVybiAwOwo+ID4gPiArCj4gPiA+ICsJaWYgKCF2aXJ0
aW9faGFzX2ZlYXR1cmUoZGV2LCBWSVJUSU9fRl9WRVJTSU9OXzEpKSB7Cj4gPiA+ICsJCWRldl93
YXJuKCZkZXYtPmRldiwKPiA+ID4gKwkJCSAibGVnYWN5IHZpcnRpbyBub3Qgc3VwcG9ydGVkIHdp
dGggcHJvdGVjdGVkIHZpcnR1YWxpemF0aW9uXG4iKTsKPiA+ID4gKwkJcmV0dXJuIC1FTk9ERVY7
Cj4gPiA+ICsJfQo+ID4gPiArCj4gPiA+ICsJaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUoZGV2LCBW
SVJUSU9fRl9JT01NVV9QTEFURk9STSkpIHsKPiA+ID4gKwkJZGV2X3dhcm4oJmRldi0+ZGV2LAo+
ID4gPiArCQkJICJzdXBwb3J0IGZvciBsaW1pdGVkIG1lbW9yeSBhY2Nlc3MgcmVxdWlyZWQgZm9y
IHByb3RlY3RlZCB2aXJ0dWFsaXphdGlvblxuIik7Cj4gPiA+ICsJCXJldHVybiAtRU5PREVWOwo+
ID4gPiArCX0KPiA+ID4gKwo+ID4gPiArCXJldHVybiAwOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+
ICAgLyogcHJvdGVjdGVkIHZpcnR1YWxpemF0aW9uICovCj4gPiA+ICAgc3RhdGljIHZvaWQgcHZf
aW5pdCh2b2lkKQo+ID4gPiAgIHsKPiA+IFdoYXQgYm90aGVycyBtZSBoZXJlIGlzIHRoYXQgYXJj
aCBjb2RlIGRlcGVuZHMgb24gdmlydGlvIG5vdy4KPiA+IEl0IHdvcmtzIGV2ZW4gd2l0aCBhIG1v
ZHVsYXIgdmlydGlvIHdoZW4gZnVuY3Rpb25zIGFyZSBpbmxpbmUsCj4gPiBidXQgaXQgc2VlbXMg
ZnJhZ2lsZTogZS5nLiBpdCBicmVha3MgdmlydGlvIGFzIGFuIG91dCBvZiB0cmVlIG1vZHVsZSwK
PiA+IHNpbmNlIGxheW91dCBvZiBzdHJ1Y3QgdmlydGlvX2RldmljZSBjYW4gY2hhbmdlLgo+IAo+
IAo+IFRoZSBjb2RlIHdhcyBvbmx5IGNhbGxlZCBmcm9tIHZpcnRpby5jIHNvIGl0IHNob3VsZCBi
ZSBmaW5lLgo+IAo+IEFuZCBteSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgd2UgZG9uJ3QgbmVlZCB0
byBjYXJlIGFib3V0IHRoZSBrQUJJIGlzc3VlCj4gZHVyaW5nIHVwc3RyZWFtIGRldmVsb3BtZW50
Pwo+IAo+IFRoYW5rcwoKTm8sIGJ1dCBzbyBmYXIgaXQgaGFzIGJlZW4gY29udmVuaWVudCBhdCBs
ZWFzdCBmb3IgbWUsIGZvciBkZXZlbG9wbWVudCwKdG8ganVzdCBiZSBhYmxlIHRvIHVubG9hZCBh
bGwgb2YgdmlydGlvIGFuZCBsb2FkIGEgZGlmZmVyZW50IHZlcnNpb24uCgoKPiAKPiA+IAo+ID4g
SSdtIG5vdCBzdXJlIHdoYXQgdG8gZG8gd2l0aCB0aGlzIHlldCwgd2lsbCB0cnkgdG8gdGhpbmsg
YWJvdXQgaXQKPiA+IG92ZXIgdGhlIHdlZWtlbmQuIFRoYW5rcyEKPiA+IAo+ID4gCj4gPiA+IC0t
IAo+ID4gPiAyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
