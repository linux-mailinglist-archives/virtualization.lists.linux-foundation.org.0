Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB301C0260
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 18:25:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A773588046;
	Thu, 30 Apr 2020 16:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1FNf+CdDG3y; Thu, 30 Apr 2020 16:25:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 143EB87FFF;
	Thu, 30 Apr 2020 16:25:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9DD7C016F;
	Thu, 30 Apr 2020 16:25:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9C6CC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 16:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A5E7187F1F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 16:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yy7HHwm-M7Ca
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 16:25:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B407E87DCC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 16:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588263931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d7EAntEKWCxipEsZHA3JwdCBrte3X/EzEzWCEi3iTqU=;
 b=hFSnA7+dVVHisruCYa2T6yMhX32scU91C5PMmT+S3RfA+OqS99sPN6bXcz6EpRJb8fe+5c
 5HZgqUFwDNzpvuZXgfaby+u6LrstGTG786aLvoO3qxSRuALw7WRCa4kczDEitgTy5fHvGn
 CSRI2WDYbhagrMNyBkhEPgVRNglhY2I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-0pqDVYv2PkquFkrAizchxg-1; Thu, 30 Apr 2020 12:25:28 -0400
X-MC-Unique: 0pqDVYv2PkquFkrAizchxg-1
Received: by mail-wr1-f72.google.com with SMTP id r11so4125551wrx.21
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 09:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d7EAntEKWCxipEsZHA3JwdCBrte3X/EzEzWCEi3iTqU=;
 b=LMWVJzaDECHEWOV/5sMwqOp9bDdI0Nw7iasx89qqWmp+2WVNf/I8C+eWqESoW60a1Q
 onA8u7NrI/yskfYd+PtEJJ07ncSJlpC2RjjqvV3HW/dJn+yGzgyGwchMMkTBdXDLGTSs
 rDgdkfA+GUJooZH0L2E5cJo0mxmBVMkxq0pRtRm0MuwWcdDlfj2+FJOoeQrNJDYJA+Ws
 K1GZ2QsOOYhVaTi7CDzVm4hmcmmSvcK9F7GzP9WjIroV3qg7O62EKq01zNY7epiZgZeS
 CLDFJsfBZc0enJybxQSZVWeoM7Kkw/IdKXs57uL8NjkNDl5TV4kEsFtwlzrMRW797ODd
 M7KA==
X-Gm-Message-State: AGi0PubIFPJ2hhVZtiCra7JPU7EfEjG0XQ2HU+RDkkmZuktSa7kDLKnu
 Bkx+doPe8AjMgJx2ADfr2VGaSB/pP9ptAlTv31F0IElQAhKCO+sbe8twMMajMTk2Wm1xZn7roxL
 RX2mPwwYjgYArtS4tJm19SfnNtFKfQbOWxs9022K8YA==
X-Received: by 2002:adf:a309:: with SMTP id c9mr4517827wrb.97.1588263925972;
 Thu, 30 Apr 2020 09:25:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypJxesyQ6DenL8g0PuIkRunaGDhr2hm8E0YBRtppq+/ppdUI56ZVeSiHPILMSpR5MD6bxfp4uQ==
X-Received: by 2002:adf:a309:: with SMTP id c9mr4517792wrb.97.1588263925657;
 Thu, 30 Apr 2020 09:25:25 -0700 (PDT)
Received: from steredhat (host108-207-dynamic.49-79-r.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id x18sm351018wrv.12.2020.04.30.09.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 09:25:24 -0700 (PDT)
Date: Thu, 30 Apr 2020 18:25:21 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Justin He <Justin.He@arm.com>
Subject: Re: [PATCH] vhost: vsock: don't send pkt when vq is not started
Message-ID: <20200430162521.k4b4t3vttfabgqal@steredhat>
References: <20200430021314.6425-1-justin.he@arm.com>
 <20200430082608.wbtqgglmtnd7e5ci@steredhat>
 <AM6PR08MB4069D4AB611B8C8180DC4B9CF7AA0@AM6PR08MB4069.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM6PR08MB4069D4AB611B8C8180DC4B9CF7AA0@AM6PR08MB4069.eurprd08.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Kaly Xin <Kaly.Xin@arm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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

T24gVGh1LCBBcHIgMzAsIDIwMjAgYXQgMTA6MDY6MjZBTSArMDAwMCwgSnVzdGluIEhlIHdyb3Rl
Ogo+IEhpIFN0ZWZhbm8KPiAKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9t
OiBTdGVmYW5vIEdhcnphcmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5jb20+Cj4gPiBTZW50OiBUaHVy
c2RheSwgQXByaWwgMzAsIDIwMjAgNDoyNiBQTQo+ID4gVG86IEp1c3RpbiBIZSA8SnVzdGluLkhl
QGFybS5jb20+Cj4gPiBDYzogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPjsg
TWljaGFlbCBTLiBUc2lya2luCj4gPiA8bXN0QHJlZGhhdC5jb20+OyBKYXNvbiBXYW5nIDxqYXNv
d2FuZ0ByZWRoYXQuY29tPjsKPiA+IGt2bUB2Z2VyLmtlcm5lbC5vcmc7IHZpcnR1YWxpemF0aW9u
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnOwo+ID4gbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgS2FseSBYaW4KPiA+IDxLYWx5LlhpbkBhcm0u
Y29tPgo+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gdmhvc3Q6IHZzb2NrOiBkb24ndCBzZW5kIHBr
dCB3aGVuIHZxIGlzIG5vdCBzdGFydGVkCj4gPgo+ID4gSGkgSmlhLAo+ID4gdGhhbmtzIGZvciB0
aGUgcGF0Y2gsIHNvbWUgY29tbWVudHMgYmVsb3c6Cj4gPgo+ID4gT24gVGh1LCBBcHIgMzAsIDIw
MjAgYXQgMTA6MTM6MTRBTSArMDgwMCwgSmlhIEhlIHdyb3RlOgo+ID4gPiBOaW5nIEJvIHJlcG9y
dGVkIGFuIGFibm9ybWFsIDItc2Vjb25kIGdhcCB3aGVuIGJvb3RpbmcgS2F0YSBjb250YWluZXIK
PiA+IFsxXS4KPiA+ID4gVGhlIHVuY29uZGl0aW9uYWwgdGltZW91dCBpcyBjYXVzZWQgYnkKPiA+
IFZTT0NLX0RFRkFVTFRfQ09OTkVDVF9USU1FT1VUIG9mCj4gPiA+IGNvbm5lY3QgYXQgY2xpZW50
IHNpZGUuIFRoZSB2aG9zdCB2c29jayBjbGllbnQgdHJpZXMgdG8gY29ubmVjdCBhbgo+ID4gPiBp
bml0bGl6aW5nIHZpcnRpbyB2c29jayBzZXJ2ZXIuCj4gPiA+Cj4gPiA+IFRoZSBhYm5vcm1hbCBm
bG93IGxvb2tzIGxpa2U6Cj4gPiA+IGhvc3QtdXNlcnNwYWNlICAgICAgICAgICB2aG9zdCB2c29j
ayAgICAgICAgICAgICAgICAgICAgICAgZ3Vlc3QgdnNvY2sKPiA+ID4gPT09PT09PT09PT09PT0g
ICAgICAgICAgID09PT09PT09PT09ICAgICAgICAgICAgICAgICAgICAgICA9PT09PT09PT09PT0K
PiA+ID4gY29ubmVjdCgpICAgICAtLS0tLS0tLT4gIHZob3N0X3RyYW5zcG9ydF9zZW5kX3BrdF93
b3JrKCkgICBpbml0aWFsaXppbmcKPiA+ID4gICAgfCAgICAgICAgICAgICAgICAgICAgIHZxLT5w
cml2YXRlX2RhdGE9PU5VTEwKPiA+ID4gICAgfCAgICAgICAgICAgICAgICAgICAgIHdpbGwgbm90
IGJlIHF1ZXVlZAo+ID4gPiAgICBWCj4gPiA+IHNjaGVkdWxlX3RpbWVvdXQoMnMpCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICB2aG9zdF92c29ja19zdGFydCgpICA8LS0tLS0tLS0tICAg
ZGV2aWNlIHJlYWR5Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBzZXQgdnEtPnByaXZh
dGVfZGF0YQo+ID4gPgo+ID4gPiB3YWl0IGZvciAycyBhbmQgZmFpbGVkCj4gPiA+Cj4gPiA+IGNv
bm5lY3QoKSBhZ2FpbiAgICAgICAgICB2cS0+cHJpdmF0ZV9kYXRhIT1OVUxMICAgICAgICAgIHJl
Y3YgY29ubmVjdGluZyBwa3QKPiA+ID4KPiA+ID4gMS4gaG9zdCB1c2Vyc3BhY2Ugc2VuZHMgYSBj
b25uZWN0IHBrdCwgYXQgdGhhdCB0aW1lLCBndWVzdCB2c29jayBpcyB1bmRlcgo+ID4gPiBpbml0
aWFsaXppbmcsIGhlbmNlIHRoZSB2aG9zdF92c29ja19zdGFydCBoYXMgbm90IGJlZW4gY2FsbGVk
LiBTbwo+ID4gPiB2cS0+cHJpdmF0ZV9kYXRhPT1OVUxMLCBhbmQgdGhlIHBrdCBpcyBub3QgYmVl
biBxdWV1ZWQgdG8gc2VuZCB0byBndWVzdC4KPiA+ID4gMi4gdGhlbiBpdCBzbGVlcHMgZm9yIDJz
Cj4gPiA+IDMuIGFmdGVyIGd1ZXN0IHZzb2NrIGZpbmlzaGVzIGluaXRpYWxpemluZywgdnEtPnBy
aXZhdGVfZGF0YSBpcyBzZXQuCj4gPiA+IDQuIFdoZW4gaG9zdCB1c2Vyc3BhY2Ugd2FrZXMgdXAg
YWZ0ZXIgMnMsIHNlbmQgY29ubmVjdGluZyBwa3QgYWdhaW4sCj4gPiA+IGV2ZXJ5dGhpbmcgaXMg
ZmluZS4KPiA+ID4KPiA+ID4gVGhpcyBmaXhlcyBpdCBieSBjaGVja2luZyB2cS0+cHJpdmF0ZV9k
YXRhIGluIHZob3N0X3RyYW5zcG9ydF9zZW5kX3BrdCwKPiA+ID4gYW5kIHJldHVybiBhdCBvbmNl
IGlmICF2cS0+cHJpdmF0ZV9kYXRhLiBUaGlzIG1ha2VzIHVzZXIgY29ubmVjdCgpCj4gPiA+IGJl
IHJldHVybmVkIHdpdGggRUNPTk5SRUZVU0VELgo+ID4gPgo+ID4gPiBBZnRlciB0aGlzIHBhdGNo
LCBrYXRhLXJ1bnRpbWUgKHdpdGggdnNvY2sgZW5hYmxlZCkgYm9vdHRpbWUgcmVkdWNlcyBmcm9t
Cj4gPiA+IDNzIHRvIDFzIG9uIFRodW5kZXJYMiBhcm02NCBzZXJ2ZXIuCj4gPiA+Cj4gPiA+IFsx
XSBodHRwczovL2dpdGh1Yi5jb20va2F0YS1jb250YWluZXJzL3J1bnRpbWUvaXNzdWVzLzE5MTcK
PiA+ID4KPiA+ID4gUmVwb3J0ZWQtYnk6IE5pbmcgQm8gPG4uYkBsaXZlLmNvbT4KPiA+ID4gU2ln
bmVkLW9mZi1ieTogSmlhIEhlIDxqdXN0aW4uaGVAYXJtLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBk
cml2ZXJzL3Zob3N0L3Zzb2NrLmMgfCA4ICsrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Zz
b2NrLmMgYi9kcml2ZXJzL3Zob3N0L3Zzb2NrLmMKPiA+ID4gaW5kZXggZTM2YWFmOWJhN2JkLi42
NzQ3NDMzNGRkODggMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvdmhvc3QvdnNvY2suYwo+ID4g
PiArKysgYi9kcml2ZXJzL3Zob3N0L3Zzb2NrLmMKPiA+ID4gQEAgLTI0MSw2ICsyNDEsNyBAQCB2
aG9zdF90cmFuc3BvcnRfc2VuZF9wa3Qoc3RydWN0IHZpcnRpb192c29ja19wa3QKPiA+ICpwa3Qp
Cj4gPiA+ICB7Cj4gPiA+ICBzdHJ1Y3Qgdmhvc3RfdnNvY2sgKnZzb2NrOwo+ID4gPiAgaW50IGxl
biA9IHBrdC0+bGVuOwo+ID4gPiArc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnE7Cj4gPiA+Cj4g
PiA+ICByY3VfcmVhZF9sb2NrKCk7Cj4gPiA+Cj4gPiA+IEBAIC0yNTIsNiArMjUzLDEzIEBAIHZo
b3N0X3RyYW5zcG9ydF9zZW5kX3BrdChzdHJ1Y3QgdmlydGlvX3Zzb2NrX3BrdAo+ID4gKnBrdCkK
PiA+ID4gIHJldHVybiAtRU5PREVWOwo+ID4gPiAgfQo+ID4gPgo+ID4gPiArdnEgPSAmdnNvY2st
PnZxc1tWU09DS19WUV9SWF07Cj4gPiA+ICtpZiAoIXZxLT5wcml2YXRlX2RhdGEpIHsKPiA+Cj4g
PiBJIHRoaW5rIGlzIGJldHRlciB0byB1c2Ugdmhvc3RfdnFfZ2V0X2JhY2tlbmQoKToKPiA+Cj4g
PiBpZiAoIXZob3N0X3ZxX2dldF9iYWNrZW5kKCZ2c29jay0+dnFzW1ZTT0NLX1ZRX1JYXSkpIHsK
PiA+IC4uLgo+ID4KPiA+IFRoaXMgZnVuY3Rpb24gc2hvdWxkIGJlIGNhbGxlZCB3aXRoICd2cS0+
bXV0ZXgnIGFjcXVpcmVkIGFzIGV4cGxhaW5lZCBpbgo+ID4gdGhlIGNvbW1lbnQsIGJ1dCBoZXJl
IHdlIGNhbiBhdm9pZCB0aGF0LCBiZWNhdXNlIHdlIGFyZSBub3QgdXNpbmcgdGhlIHZxLAo+ID4g
c28gaXQgaXMgc2FmZSwgYmVjYXVzZSBpbiB2aG9zdF90cmFuc3BvcnRfZG9fc2VuZF9wa3QoKSB3
ZSBjaGVjayBpdCBhZ2Fpbi4KPiA+Cj4gPiBQbGVhc2UgYWRkIGEgY29tbWVudCBleHBsYWluaW5n
IHRoYXQuCj4gPgo+IAo+IFRoYW5rcywgdmhvc3RfdnFfZ2V0X2JhY2tlbmQgaXMgYmV0dGVyLiBJ
IGNob3NlIGEgNS4zIGtlcm5lbCB0byBkZXZlbG9wCj4gYW5kIG1pc3NlZCB0aGlzIGhlbHBlci4K
CjotKQoKPiA+Cj4gPiBBcyBhbiBhbHRlcm5hdGl2ZSB0byB0aGlzIHBhdGNoLCBzaG91bGQgd2Ug
a2ljayB0aGUgc2VuZCB3b3JrZXIgd2hlbiB0aGUKPiA+IGRldmljZSBpcyByZWFkeT8KPiA+Cj4g
PiBJSVVDIHdlIHJlYWNoIHRoZSB0aW1lb3V0IGJlY2F1c2UgdGhlIHNlbmQgd29ya2VyICh0aGF0
IHJ1bnMKPiA+IHZob3N0X3RyYW5zcG9ydF9kb19zZW5kX3BrdCgpKSBleGl0cyBpbW1lZGlhdGVs
eSBzaW5jZSAndnEtPnByaXZhdGVfZGF0YScKPiA+IGlzIE5VTEwsIGFuZCBubyBvbmUgd2lsbCBy
ZXF1ZXVlIGl0Lgo+ID4KPiA+IExldCdzIGRvIGl0IHdoZW4gd2Uga25vdyB0aGUgZGV2aWNlIGlz
IHJlYWR5Ogo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Zzb2NrLmMgYi9kcml2
ZXJzL3Zob3N0L3Zzb2NrLmMKPiA+IGluZGV4IGUzNmFhZjliYTdiZC4uMjk1YjU4Njc5NDRmIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy92aG9zdC92c29jay5jCj4gPiArKysgYi9kcml2ZXJzL3Zo
b3N0L3Zzb2NrLmMKPiA+IEBAIC01NDMsNiArNTQzLDExIEBAIHN0YXRpYyBpbnQgdmhvc3RfdnNv
Y2tfc3RhcnQoc3RydWN0IHZob3N0X3Zzb2NrCj4gPiAqdnNvY2spCj4gPiAgICAgICAgICAgICAg
ICAgbXV0ZXhfdW5sb2NrKCZ2cS0+bXV0ZXgpOwo+ID4gICAgICAgICB9Cj4gPgo+ID4gKyAgICAg
ICAvKiBTb21lIHBhY2tldHMgbWF5IGhhdmUgYmVlbiBxdWV1ZWQgYmVmb3JlIHRoZSBkZXZpY2Ug
d2FzIHN0YXJ0ZWQsCj4gPiArICAgICAgICAqIGxldCdzIGtpY2sgdGhlIHNlbmQgd29ya2VyIHRv
IHNlbmQgdGhlbS4KPiA+ICsgICAgICAgICovCj4gPiArICAgICAgIHZob3N0X3dvcmtfcXVldWUo
JnZzb2NrLT5kZXYsICZ2c29jay0+c2VuZF9wa3Rfd29yayk7Cj4gPiArCj4gWWVzLCBpdCB3b3Jr
cy4KPiBCdXQgZG8geW91IHRoaW5rIGEgdGhyZXNob2xkIHNob3VsZCBiZSBzZXQgaGVyZSB0byBw
cmV2ZW50IHRoZSBxdWV1ZQo+IGZyb20gYmVpbmcgdG9vIGxvbmc/IEUuZy4gdGhlIGNsaWVudCB1
c2VyIHNlbmRzIHRvbyBtYW55IGNvbm5lY3QgcGt0cwo+IGluIGEgc2hvcnQgdGltZSBiZWZvcmUg
dGhlIHNlcnZlciBpcyBjb21wbGV0ZWx5IHJlYWR5LgoKV2hlbiB0aGUgdXNlciBjYWxsIHRoZSBj
b25uZWN0KCkgdGhlIHNvY2tldCBzdGF0dXMgaXMgbW92ZWQgdG8KU1NfQ09OTkVDVElORyAoc2Vl
IG5ldC92bXdfdnNvY2svYWZfdnNvY2suYyksIHNvIGFub3RoZXIgY29ubmVjdCgpIG9uCnRoZSBz
YW1lIHNvY2tldCB3aWxsIHJlY2VpdmUgRUFMUkVBRFkgZXJyb3IuCgpJZiB0aGUgdXNlciB1c2Vz
IG11bHRpcGxlIHNvY2tldHMsIHRoZSBzb2NrZXQgbGF5ZXIgYWxyZWFkeSBjaGVjayBmb3IKYW55
IGxpbWl0cywgc28gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgcHV0IGEgdGhyZXNob2xkIGhlcmUu
Cgo+IAo+ID4gICAgICAgICBtdXRleF91bmxvY2soJnZzb2NrLT5kZXYubXV0ZXgpOwo+ID4gICAg
ICAgICByZXR1cm4gMDsKPiA+Cj4gPiBJIGRpZG4ndCB0ZXN0IGl0LCBjYW4geW91IHRyeSBpZiBp
dCBmaXhlcyB0aGUgaXNzdWU/Cj4gPgo+ID4gSSdtIG5vdCBzdXJlIHdoaWNoIGlzIGJldHRlci4u
Lgo+IEkgZG9uJ3Qga25vdywgZWl0aGVyLiBXYWl0IGZvciBtb3JlIGNvbW1lbnRzIPCfmIoKCkkg
cHJlZmVyIHRoZSBzZWNvbmQgb3B0aW9uLCBiZWNhdXNlIHRoZSBkZXZpY2UgaXMgaW4gYSB0cmFu
c2l0aW9uYWwKc3RhdGUgYW5kIGEgY29ubmVjdCBjYW4gYmxvY2sgKGZvciBhdCBtb3N0IHR3byBz
ZWNvbmRzKSB1bnRpbCB0aGUgZGV2aWNlIGlzCnN0YXJ0ZWQuCgpGb3IgdGhlIGZpcnN0IG9wdGlv
biwgSSdtIGFsc28gbm90IHN1cmUgaWYgRUNPTk5SRUZVU0VEIGlzIHRoZSByaWdodCBlcnJvcgp0
byByZXR1cm4sIG1heWJlIGlzIGJldHRlciBFTkVUVU5SRUFDSC4KCkNoZWVycywKU3RlZmFubwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
