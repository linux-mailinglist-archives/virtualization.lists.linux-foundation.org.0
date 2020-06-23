Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D7292204C4B
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 10:26:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 24E952D9E5;
	Tue, 23 Jun 2020 08:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KtKHGOLM+2yA; Tue, 23 Jun 2020 08:25:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8CAB3204EC;
	Tue, 23 Jun 2020 08:25:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C48CC016F;
	Tue, 23 Jun 2020 08:25:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B03AC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 08:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 077F488A82
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 08:25:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3Z07ehLzjBO
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 08:25:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AA01D88A5E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 08:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592900752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uatLoTht3LpxtV8y54s42CvqtAcAPf7U2lYUBgXuz/c=;
 b=fVb3U84p2K2Yg+P/gazZWZawGmI4PlUwIxqiyU/xOwJ46x7o8PuY/6PZmCGXjFeVPFbL2d
 kh5IEEmuSLpgzhBhboXsUUB2cXqXyU75nE1M69H3ROW2WVU22x0tocnY2gpH/Vga3wR6s6
 DhFC3VDudS6Uh4nNWD4lM1AdnW8Hc/E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-41RWQiJlMuO8qJJ51i_4Tw-1; Tue, 23 Jun 2020 04:25:50 -0400
X-MC-Unique: 41RWQiJlMuO8qJJ51i_4Tw-1
Received: by mail-wr1-f70.google.com with SMTP id b14so14267893wrp.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 01:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uatLoTht3LpxtV8y54s42CvqtAcAPf7U2lYUBgXuz/c=;
 b=n3/N/l183WNOl2Lt429Ps4ofBhQlITIhZ0cRWFUiw8TeymEkjpLI6pfa/XVRg4nVio
 YX/Kt1bPSdk4wQO6ecfzvYNHsvCzpmsfv8VCwA8SX+MV0CwTZJQ7Kth7T5YOE+Jg1k7M
 yn4YN3u71W2rDph506cNfDzQ/Epka7r6Z9LKixYJP12x/hVuGEgTqGkaFbcs4M82R3xN
 Oi0bToGTBnpcXJfSPxXmED+5HCyVqTSIwEC6Mx9Gr7C3h6JTHB7Todqv/SN4QJP913II
 F574n1A+vGJDLEHLWyKZUn+RSXv2IIGntDJg3VmsRLun9YSVHj3xtz9iGrUeJaWeJF8g
 dZ4w==
X-Gm-Message-State: AOAM5306VxfQLAR3PKoV360RXg2gNCwQvURWz9Jq+T7F03AziHCwQjO2
 O9hutxZDtHCckD1eh83KNn2kcLP3sAVs4sWTEGW1qh3V6fGlggqumADIJechHYFOhnTnwIRAG9N
 5jKCa1YSuVLxBY8OmwlOZdUCO5CZ5pgPmHK0AkZaVtg==
X-Received: by 2002:adf:e482:: with SMTP id i2mr36531wrm.75.1592900749387;
 Tue, 23 Jun 2020 01:25:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc3XogzeNwsdZ7v2sDlZRwXqKbrYs2e6doW+SBbFx4Sho/d0OEnV4LbHlJbrymQKkvurtxAg==
X-Received: by 2002:adf:e482:: with SMTP id i2mr36515wrm.75.1592900749185;
 Tue, 23 Jun 2020 01:25:49 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 e5sm19713184wrs.33.2020.06.23.01.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 01:25:48 -0700 (PDT)
Date: Tue, 23 Jun 2020 04:25:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH RFC v8 02/11] vhost: use batched get_vq_desc version
Message-ID: <20200623042456-mutt-send-email-mst@kernel.org>
References: <20200611113404.17810-1-mst@redhat.com>
 <20200611113404.17810-3-mst@redhat.com>
 <0332b0cf-cf00-9216-042c-e870efa33626@redhat.com>
 <20200622115946-mutt-send-email-mst@kernel.org>
 <c56cc86d-a420-79ca-8420-e99db91980fa@redhat.com>
 <CAJaqyWc3C_Td_SpV97CuemkQH9vH+EL3sGgeWGE82E5gYxZNCA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWc3C_Td_SpV97CuemkQH9vH+EL3sGgeWGE82E5gYxZNCA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm list <kvm@vger.kernel.org>, virtualization@lists.linux-foundation.org
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

T24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMDk6MDA6NTdBTSArMDIwMCwgRXVnZW5pbyBQZXJleiBN
YXJ0aW4gd3JvdGU6Cj4gT24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgNDo1MSBBTSBKYXNvbiBXYW5n
IDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPgo+ID4gT24gMjAyMC82LzIzIOS4
iuWNiDEyOjAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gPiA+IE9uIFdlZCwgSnVuIDE3
LCAyMDIwIGF0IDExOjE5OjI2QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+PiBPbiAy
MDIwLzYvMTEg5LiL5Y2INzozNCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+ID4gPj4+ICAg
IHN0YXRpYyB2b2lkIHZob3N0X3ZxX2ZyZWVfaW92ZWNzKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUg
KnZxKQo+ID4gPj4+ICAgIHsKPiA+ID4+PiAgICAga2ZyZWUodnEtPmRlc2NzKTsKPiA+ID4+PiBA
QCAtMzk0LDYgKzQwMCw5IEBAIHN0YXRpYyBsb25nIHZob3N0X2Rldl9hbGxvY19pb3ZlY3Moc3Ry
dWN0IHZob3N0X2RldiAqZGV2KQo+ID4gPj4+ICAgICBmb3IgKGkgPSAwOyBpIDwgZGV2LT5udnFz
OyArK2kpIHsKPiA+ID4+PiAgICAgICAgICAgICB2cSA9IGRldi0+dnFzW2ldOwo+ID4gPj4+ICAg
ICAgICAgICAgIHZxLT5tYXhfZGVzY3MgPSBkZXYtPmlvdl9saW1pdDsKPiA+ID4+PiArICAgICAg
ICAgICBpZiAodmhvc3RfdnFfbnVtX2JhdGNoX2Rlc2NzKHZxKSA8IDApIHsKPiA+ID4+PiArICAg
ICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPj4+ICsgICAgICAgICAgIH0KPiA+
ID4+IFRoaXMgY2hlY2sgYnJlYWtzIHZkcGEgd2hpY2ggc2V0IGlvdl9saW1pdCB0byB6ZXJvLiBD
b25zaWRlciBpb3ZfbGltaXQgaXMKPiA+ID4+IG1lYW5pbmdsZXNzIHRvIHZEUEEsIEkgd29uZGVy
IHdlIGNhbiBza2lwIHRoZSB0ZXN0IHdoZW4gZGV2aWNlIGRvZXNuJ3QgdXNlCj4gPiA+PiB3b3Jr
ZXIuCj4gPiA+Pgo+ID4gPj4gVGhhbmtzCj4gPiA+IEl0IGRvZXNuJ3QgbmVlZCBpb3ZlY3MgYXQg
YWxsLCByaWdodD8KPiA+ID4KPiA+ID4gLS0gTVNUCj4gPgo+ID4KPiA+IFllcywgc28gd2UgbWF5
IGNob29zZSB0byBieXBhc3MgdGhlIGlvdmVjcyBhcyB3ZWxsLgo+ID4KPiA+IFRoYW5rcwo+ID4K
PiAKPiBJIHRoaW5rIHRoYXQgdGhlIGttYWxsb2NfYXJyYXkgcmV0dXJucyBaRVJPX1NJWkVfUFRS
IGZvciBhbGwgb2YgdGhlbQo+IGluIHRoYXQgY2FzZSwgc28gSSBkaWRuJ3QgYm90aGVyIHRvIHNr
aXAgdGhlIGttYWxsb2NfYXJyYXkgcGFydHMuCj4gV291bGQgeW91IHByZWZlciB0byBza2lwIHRo
ZW0gYWxsIGFuZCBsZXQgdGhlbSBOVUxMPyBPciBoYXZlIEkKPiBtaXN1bmRlcnN0b29kIHdoYXQg
eW91IG1lYW4/Cj4gCj4gVGhhbmtzIQoKU29ycnkgYWJvdXQgYmVpbmcgdW5jbGVhci4gSSBqdXN0
IG1lYW50IHRoYXQgaXQgc2VlbXMgY2xlYW5lcgp0byBjaGVjayBmb3IgaW92X2xpbWl0IGJlaW5n
IDAgbm90IGZvciB3b3JrZXIgdGhyZWFkLgoKLS0gCk1TVAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
