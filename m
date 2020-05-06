Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B701C6D7C
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 11:47:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8D3DD24CC1;
	Wed,  6 May 2020 09:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7gGrDbsdh0gs; Wed,  6 May 2020 09:47:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1EA1B24C8F;
	Wed,  6 May 2020 09:47:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ECC3EC0859;
	Wed,  6 May 2020 09:47:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C36FC0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 42B99876D7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id erMe1z8pd6Fc
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:47:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5008D86E6F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588758426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9sS983PmfppClLAD95W4RbZvvHCy4pYMhZVa7NWgzU=;
 b=Dwb+436WtNWdZC4+3SwsuooyGuda1f+qdXyvuFrFI5EoPmVooHjyrnR0PCpef9ICkaXZHz
 5pFtLHkc8zt61iOuQXpxZbjVcxz6h+GXnuBRtJEmgEPeJheV5eDgIxFrx9pE2DNuMlDy6S
 SADkvrN8V+Jdjh0y06gw+uZoZfYaD3M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-gUn2QiY4N_yAtgBcck5aFA-1; Wed, 06 May 2020 05:47:03 -0400
X-MC-Unique: gUn2QiY4N_yAtgBcck5aFA-1
Received: by mail-wr1-f70.google.com with SMTP id y4so1040949wrt.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 06 May 2020 02:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=w9sS983PmfppClLAD95W4RbZvvHCy4pYMhZVa7NWgzU=;
 b=pt5PQMwATtOe7VU+lWuVM0NdLpF52z1dHp+GVaZJ9T+bleDPO/iZG1FpPJePq+geU1
 5lB8aDgbaVsCtiofjwg4pUP0FEc3m4A3TSbpk/z84TASQHJx/Zvk1RGbCuQ7LVH4eTqN
 UR7zEeDgfqIIjm8ZtIIBQzeC9fsssdSs+8wO/RqghL7CCjDYfsA5TZQoJxBd743kWpkt
 yBXXT4QTbh+dURCFW7j3WEHqS6wCSPGmOL4GwovLiic9dJGrjnr18N6gfHrbmceuAyMW
 YhkF9Fb/W1zgHvjsHSGHaorSg4TIrakx8I1d5rbTAE7zva48ssg4dWsSgrsOSBkqpG43
 xVMg==
X-Gm-Message-State: AGi0PubNgIkpIVDHKTLX9N/yCG4QdNZsFSaSyCD5QHYYOrB3RTDoqJPy
 nfQkrxmFxkHtp5btfC3UFv5f1T7Ih08wn+d73j1LFwqeRfTMWeunRsrPZrkS+b2N32EtqqtsLB6
 DBlgm+nskayAnNGKTGp3eP5qm7rk8TOV4ZqzSCbPHxA==
X-Received: by 2002:a1c:6402:: with SMTP id y2mr3483287wmb.116.1588758422665; 
 Wed, 06 May 2020 02:47:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypJLFM/iL7UVJP6AWuYr6XnmG4Y7mYLYvXVuwtw2JDBHwlkMdlwBhYhsts9edtJoB4WeNEhqOg==
X-Received: by 2002:a1c:6402:: with SMTP id y2mr3483265wmb.116.1588758422450; 
 Wed, 06 May 2020 02:47:02 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 a139sm491033wme.18.2020.05.06.02.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 02:47:01 -0700 (PDT)
Date: Wed, 6 May 2020 05:46:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net-next 1/2] virtio-net: don't reserve space for vnet
 header for XDP
Message-ID: <20200506054619-mutt-send-email-mst@kernel.org>
References: <20200506061633.16327-1-jasowang@redhat.com>
 <20200506102123.739f1233@carbon>
 <3ecb558b-5281-2497-db3c-6aae7d7f882b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3ecb558b-5281-2497-db3c-6aae7d7f882b@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Jesper Dangaard Brouer <brouer@redhat.com>, "Jubran,
 Samih" <sameehj@amazon.com>, bpf@vger.kernel.org
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

T24gV2VkLCBNYXkgMDYsIDIwMjAgYXQgMDQ6MzQ6MzZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzUvNiDkuIvljYg0OjIxLCBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyIHdy
b3RlOgo+ID4gT24gV2VkLCAgNiBNYXkgMjAyMCAxNDoxNjozMiArMDgwMAo+ID4gSmFzb24gV2Fu
ZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiAKPiA+ID4gV2UgdHJpZWQgdG8gcmVz
ZXJ2ZSBzcGFjZSBmb3Igdm5ldCBoZWFkZXIgYmVmb3JlCj4gPiA+IHhkcC5kYXRhX2hhcmRfc3Rh
cnQuIEJ1dCB0aGlzIGlzIHVzZWxlc3Mgc2luY2UgdGhlIHBhY2tldCBjb3VsZCBiZQo+ID4gPiBt
b2RpZmllZCBieSBYRFAgd2hpY2ggbWF5IGludmFsaWRhdGUgdGhlIGluZm9ybWF0aW9uIHN0b3Jl
ZCBpbiB0aGUKPiA+ID4gaGVhZGVyIGFuZAo+ID4gSU1ITyBhYm92ZSBzdGF0ZW1lbnRzIGFyZSB3
cm9uZy4gWERQIGNhbm5vdCBhY2Nlc3MgbWVtb3J5IGJlZm9yZQo+ID4geGRwLmRhdGFfaGFyZF9z
dGFydC4gVGh1cywgaXQgaXMgc2FmZSB0byBzdG9yZSBhIHZuZXQgaGVhZGVycyBiZWZvcmUKPiA+
IHhkcC5kYXRhX2hhcmRfc3RhcnQuIChUaGUgc2ZjIGRyaXZlciBhbHNvIHVzZSB0aGlzICJiZWZv
cmUiIGFyZWEpLgo+IAo+IAo+IFRoZSBwcm9ibGVtIGlzIGlmIHdlIHBsYWNlIHZuZXQgaGVhZGVy
IGJlZm9yZSBkYXRhX2hhcmRfc3RhcnQsIHZpcnRpby1uZXQKPiB3aWxsIGZhaWwgYW55IGhlYWRl
ciBhZGp1c3RtZW50Lgo+IAo+IE9yIGRvIHlvdSBtZWFuIHRvIGNvcHkgdm5ldCBoZWFkZXIgYmVm
b3JlIGRhdGFfaGFyZF9zdGFydCBiZWZvcmUgcHJvY2Vzc2luZwo+IFhEUD8KPiAKPiAKPiA+IAo+
ID4gPiB0aGVyZSdzIG5vIHdheSBmb3IgWERQIHRvIGtub3cgdGhlIGV4aXN0ZW5jZSBvZiB0aGUg
dm5ldCBoZWFkZXIgY3VycmVudGx5Lgo+ID4gSXQgaXMgdHJ1ZSB0aGF0IFhEUCBpcyB1bmF3YXJl
IG9mIHRoaXMgYXJlYSwgd2hpY2ggaXMgdGhlIHdheSBpdAo+ID4gc2hvdWxkIGJlLiAgQ3VycmVu
dGx5IHRoZSBhcmVhIHdpbGwgc3Vydml2ZSBhZnRlciBjYWxsaW5nIEJQRi9YRFAuCj4gPiBBZnRl
ciB5b3VyIGNoYW5nZSBpdCB3aWxsIGJlIG92ZXJ3cml0dGVuIGluIHhkcF9mcmFtZSBjYXNlcy4K
PiA+IAo+ID4gCj4gPiA+IFNvIGxldCdzIGp1c3Qgbm90IHJlc2VydmUgc3BhY2UgZm9yIHZuZXQg
aGVhZGVyIGluIHRoaXMgY2FzZS4KPiA+IEkgdGhpbmsgdGhpcyBpcyBhIHdyb25nIGFwcHJvYWNo
IQo+ID4gCj4gPiBXZSBhcmUgd29ya2luZyBvbiBzdXBwb3J0aW5nIEdSTyBtdWx0aS1idWZmZXIg
Zm9yIFhEUC4gIFRoZSB2bmV0IGhlYWRlcgo+ID4gY29udGFpbnMgR1JPIGluZm9ybWF0aW9uIChz
ZWUgcGFob2xlIGJlbG93IHNpZ24pLgo+IAo+IAo+IEFub3RoZXIgbm90ZSBpcyB0aGF0IHNpbmNl
IHdlIG5lZWQgcmVzZXJ2ZSByb29tIGZvciBza2Jfc2hhcmVkX2luZm8sIEdSTyBmb3IKPiBYRFAg
bWF5IHByb2JhYmx5IGxlYWQgbW9yZSBmcmFnIGxpc3QuCj4gCj4gCj4gPiAgIEl0IGlzIGN1cnJl
bnRseSBub3QKPiA+IHVzZWQgaW4gdGhlIFhEUCBjYXNlLCBidXQgd2Ugd2lsbCBiZSB3b3JraW5n
IHRvd2FyZHMgdXNpbmcgaXQuCj4gCj4gCj4gR29vZCB0byBrbm93IHRoYXQsIGJ1dCBJIHRoaW5r
IGl0IGNhbiBvbmx5IHdvcmsgd2hlbiB0aGUgcGFja2V0IGlzIG5vdAo+IG1vZGlmaWVkIGJ5IFhE
UD8KPiAKPiAKPiA+IFRoZXJlCj4gPiBhcmUgYSBsb3Qgb2YgdW5hbnN3ZXJlZCBxdWVzdGlvbnMg
b24gaG93IHRoaXMgd2lsbCBiZSBpbXBsZW1lbnRlZC4KPiA+IFRodXMsIEkgY2Fubm90IGxheW91
dCBob3cgd2UgYXJlIGdvaW5nIHRvIGxldmVyYWdlIHRoaXMgaW5mbyB5ZXQsIGJ1dAo+ID4geW91
ciBwYXRjaCBhcmUga2lsbGluZyB0aGlzIGluZm8sIHdoaWNoIElITU8gaXMgZ29pbmcgaW4gdGhl
IHdyb25nCj4gPiBkaXJlY3Rpb24uCj4gCj4gCj4gSSBjYW4gY29weSB2bmV0IGhlYWRlciBhaGVh
ZCBvZiBkYXRhX2hhcmRfc3RhcnQsIGRvZXMgaXQgd29yayBmb3IgeW91Pwo+IAo+IFRoYW5rcwoK
VGhhdCdzIGxpa2VseSB0byBiZSBzb21ld2hhdCBleHBlbnNpdmUuCgoKPiAKPiA+IAo+ID4gCj4g
PiA+IENjOiBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyIDxicm91ZXJAcmVkaGF0LmNvbT4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiA+ID4gLS0t
Cj4gPiA+ICAgZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIHwgNiArKystLS0KPiA+ID4gICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYyBiL2RyaXZlcnMvbmV0L3ZpcnRp
b19uZXQuYwo+ID4gPiBpbmRleCAxMWY3MjI0NjA1MTMuLjk4ZGQ3NWI2NjVhNSAxMDA2NDQKPiA+
ID4gLS0tIGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbmV0
L3ZpcnRpb19uZXQuYwo+ID4gPiBAQCAtNjg0LDggKzY4NCw4IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tf
YnVmZiAqcmVjZWl2ZV9zbWFsbChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gPiAgIAkJCXBh
Z2UgPSB4ZHBfcGFnZTsKPiA+ID4gICAJCX0KPiA+ID4gLQkJeGRwLmRhdGFfaGFyZF9zdGFydCA9
IGJ1ZiArIFZJUlRORVRfUlhfUEFEICsgdmktPmhkcl9sZW47Cj4gPiA+IC0JCXhkcC5kYXRhID0g
eGRwLmRhdGFfaGFyZF9zdGFydCArIHhkcF9oZWFkcm9vbTsKPiA+ID4gKwkJeGRwLmRhdGFfaGFy
ZF9zdGFydCA9IGJ1ZiArIFZJUlRORVRfUlhfUEFEOwo+ID4gPiArCQl4ZHAuZGF0YSA9IHhkcC5k
YXRhX2hhcmRfc3RhcnQgKyB4ZHBfaGVhZHJvb20gKyB2aS0+aGRyX2xlbjsKPiA+ID4gICAJCXhk
cC5kYXRhX2VuZCA9IHhkcC5kYXRhICsgbGVuOwo+ID4gPiAgIAkJeGRwLmRhdGFfbWV0YSA9IHhk
cC5kYXRhOwo+ID4gPiAgIAkJeGRwLnJ4cSA9ICZycS0+eGRwX3J4cTsKPiA+ID4gQEAgLTg0NSw3
ICs4NDUsNyBAQCBzdGF0aWMgc3RydWN0IHNrX2J1ZmYgKnJlY2VpdmVfbWVyZ2VhYmxlKHN0cnVj
dCBuZXRfZGV2aWNlICpkZXYsCj4gPiA+ICAgCQkgKiB0aGUgZGVzY3JpcHRvciBvbiBpZiB3ZSBn
ZXQgYW4gWERQX1RYIHJldHVybiBjb2RlLgo+ID4gPiAgIAkJICovCj4gPiA+ICAgCQlkYXRhID0g
cGFnZV9hZGRyZXNzKHhkcF9wYWdlKSArIG9mZnNldDsKPiA+ID4gLQkJeGRwLmRhdGFfaGFyZF9z
dGFydCA9IGRhdGEgLSBWSVJUSU9fWERQX0hFQURST09NICsgdmktPmhkcl9sZW47Cj4gPiA+ICsJ
CXhkcC5kYXRhX2hhcmRfc3RhcnQgPSBkYXRhIC0gVklSVElPX1hEUF9IRUFEUk9PTTsKPiA+ID4g
ICAJCXhkcC5kYXRhID0gZGF0YSArIHZpLT5oZHJfbGVuOwo+ID4gPiAgIAkJeGRwLmRhdGFfZW5k
ID0geGRwLmRhdGEgKyAobGVuIC0gdmktPmhkcl9sZW4pOwo+ID4gPiAgIAkJeGRwLmRhdGFfbWV0
YSA9IHhkcC5kYXRhOwo+ID4gCj4gPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
