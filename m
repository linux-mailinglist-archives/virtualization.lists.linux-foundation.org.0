Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 158E51F12A2
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 08:02:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 84A1985B80;
	Mon,  8 Jun 2020 06:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prOm1n6lXHun; Mon,  8 Jun 2020 06:02:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E613E85B81;
	Mon,  8 Jun 2020 06:02:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6DCAC016F;
	Mon,  8 Jun 2020 06:02:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43675C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3EF678679A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDrQN92BlDh8
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:01:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1DF818669A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 06:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591596118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h1jA/2yspI1Kg+Xtq3l1EAGzt+HBYj3BxWgseMub36o=;
 b=WKmlCZeYuo1TB6gMMzWd0DunV6KT3UKtnTBPqkkZUGutooBjHRNaJ0LYiTNC+y4u+kWMOX
 NhPrMoC1Ms2v8+IL0XvLq2hbIdU7XaajcJZIsZDBtqJDk4IC/fkeAD6S025OlpRau0gkKQ
 ad/b9vTBnOKCXKYAFmh8+k2xHpmFvIU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-82B8SgglN3yfc06tPWScOw-1; Mon, 08 Jun 2020 02:01:56 -0400
X-MC-Unique: 82B8SgglN3yfc06tPWScOw-1
Received: by mail-wm1-f71.google.com with SMTP id r1so1168961wmh.7
 for <virtualization@lists.linux-foundation.org>;
 Sun, 07 Jun 2020 23:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=h1jA/2yspI1Kg+Xtq3l1EAGzt+HBYj3BxWgseMub36o=;
 b=QX0L1A9JMrPIlnwOdWpq3PtEjzHZIchP+Oz7RdFBMvsGge+C+vVCAbRGGbTmTptxq0
 Q7u6fo9AXVrcggNRQdVVlae/9+wfUeFGgLJI3EKME2ZNias6cVfjWkXuVM1UT9jetOXX
 3UwE64GLLTgMkxpbwLf3ognlp8gHFZ2os/l9MjugACk3Q+oMR36sUiQ7Ys9Gz3e4jb3O
 7owLDN/fy6RON4Rk1TnOLkPkX2CeAttkXHnu2nO0321NzUwhM7yocw547wKFyB51kMp5
 x5sn6lW8+S9E7RRAEj0w0Vo3TRKya+g66HPxchjGOJWeo8Gpc6L6/pvGLjC4Dma5fgJk
 PUfw==
X-Gm-Message-State: AOAM532BKRwuiWIdrQN2gtQiY9s9zG0AHfrmo0bszF9AqtuTgU6knYBJ
 JG959qCvBxTcBy6mScvPV2aDtAwEJkaglKlwkijgXhfpgmY6HvVy7CRDwDwc/fOucVs/lJO0t38
 v89hqwctZaTEjfsWROQRDjEaB0pNYqcFm+RFiWdTD1A==
X-Received: by 2002:a5d:468d:: with SMTP id u13mr23298769wrq.73.1591596115427; 
 Sun, 07 Jun 2020 23:01:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMtROZekUWaS9qn3KFC7xkMhTFpOrxDGPEfYMCPM7y6HFTjboC8wnw+oAxOEoXkXu0WIagpQ==
X-Received: by 2002:a5d:468d:: with SMTP id u13mr23298753wrq.73.1591596115216; 
 Sun, 07 Jun 2020 23:01:55 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 g82sm21407426wmf.1.2020.06.07.23.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 23:01:54 -0700 (PDT)
Date: Mon, 8 Jun 2020 02:01:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC 03/13] vhost: batching fetches
Message-ID: <20200608020112-mutt-send-email-mst@kernel.org>
References: <20200602130543.578420-1-mst@redhat.com>
 <20200602130543.578420-4-mst@redhat.com>
 <3323daa2-19ed-02de-0ff7-ab150f949fff@redhat.com>
 <20200604045830-mutt-send-email-mst@kernel.org>
 <6c2e6cc7-27c5-445b-f252-0356ff8a83f3@redhat.com>
 <20200607095219-mutt-send-email-mst@kernel.org>
 <0d791fe6-8fbe-ddcc-07fa-efbd4fac5ea4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0d791fe6-8fbe-ddcc-07fa-efbd4fac5ea4@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gTW9uLCBKdW4gMDgsIDIwMjAgYXQgMTE6MzU6NDBBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvNyDkuIvljYg5OjU3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBGcmksIEp1biAwNSwgMjAyMCBhdCAxMTo0MDoxN0FNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiBPbiAyMDIwLzYvNCDkuIvljYg0OjU5LCBNaWNoYWVsIFMuIFRzaXJraW4g
d3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBKdW4gMDMsIDIwMjAgYXQgMDM6Mjc6MzlQTSArMDgwMCwg
SmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+IE9uIDIwMjAvNi8yIOS4i+WNiDk6MDYsIE1pY2hh
ZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+ID4gPiA+ID4gV2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQs
IG5ldyBhbmQgb2xkIGNvZGUgcGVyZm9ybSBpZGVudGljYWxseS4KPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+IExvdHMgb2YgZXh0cmEgb3B0aW1pemF0aW9ucyBhcmUgbm93IHBvc3NpYmxlLCBlLmcu
Cj4gPiA+ID4gPiA+IHdlIGNhbiBmZXRjaCBtdWx0aXBsZSBoZWFkcyB3aXRoIGNvcHlfZnJvbS90
b191c2VyIG5vdy4KPiA+ID4gPiA+ID4gV2UgY2FuIGdldCByaWQgb2YgbWFpbnRhaW5pbmcgdGhl
IGxvZyBhcnJheS4gIEV0YyBldGMuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBNaWNoYWVsIFMuIFRzaXJraW48bXN0QHJlZGhhdC5jb20+Cj4gPiA+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEV1Z2VuaW8gUMOpcmV6PGVwZXJlem1hQHJlZGhhdC5jb20+Cj4gPiA+ID4gPiA+
IExpbms6aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIwMDQwMTE4MzExOC44MzM0LTQtZXBl
cmV6bWFAcmVkaGF0LmNvbQo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRz
aXJraW48bXN0QHJlZGhhdC5jb20+Cj4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiAgICAgZHJp
dmVycy92aG9zdC90ZXN0LmMgIHwgIDIgKy0KPiA+ID4gPiA+ID4gICAgIGRyaXZlcnMvdmhvc3Qv
dmhvc3QuYyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0K
PiA+ID4gPiA+ID4gICAgIGRyaXZlcnMvdmhvc3Qvdmhvc3QuaCB8ICA1ICsrKystCj4gPiA+ID4g
PiA+ICAgICAzIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC90ZXN0
LmMgYi9kcml2ZXJzL3Zob3N0L3Rlc3QuYwo+ID4gPiA+ID4gPiBpbmRleCA5YTNhMDkwMDVlMDMu
LjAyODA2ZDZmODRlZiAxMDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy92aG9zdC90ZXN0
LmMKPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy92aG9zdC90ZXN0LmMKPiA+ID4gPiA+ID4gQEAg
LTExOSw3ICsxMTksNyBAQCBzdGF0aWMgaW50IHZob3N0X3Rlc3Rfb3BlbihzdHJ1Y3QgaW5vZGUg
Kmlub2RlLCBzdHJ1Y3QgZmlsZSAqZikKPiA+ID4gPiA+ID4gICAgIAlkZXYgPSAmbi0+ZGV2Owo+
ID4gPiA+ID4gPiAgICAgCXZxc1tWSE9TVF9URVNUX1ZRXSA9ICZuLT52cXNbVkhPU1RfVEVTVF9W
UV07Cj4gPiA+ID4gPiA+ICAgICAJbi0+dnFzW1ZIT1NUX1RFU1RfVlFdLmhhbmRsZV9raWNrID0g
aGFuZGxlX3ZxX2tpY2s7Cj4gPiA+ID4gPiA+IC0Jdmhvc3RfZGV2X2luaXQoZGV2LCB2cXMsIFZI
T1NUX1RFU1RfVlFfTUFYLCBVSU9fTUFYSU9WLAo+ID4gPiA+ID4gPiArCXZob3N0X2Rldl9pbml0
KGRldiwgdnFzLCBWSE9TVF9URVNUX1ZRX01BWCwgVUlPX01BWElPViArIDY0LAo+ID4gPiA+ID4g
PiAgICAgCQkgICAgICAgVkhPU1RfVEVTVF9QS1RfV0VJR0hULCBWSE9TVF9URVNUX1dFSUdIVCwg
TlVMTCk7Cj4gPiA+ID4gPiA+ICAgICAJZi0+cHJpdmF0ZV9kYXRhID0gbjsKPiA+ID4gPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3Qu
Ywo+ID4gPiA+ID4gPiBpbmRleCA4ZjlhMDcyODI2MjUuLmFjYTJhNWIwZDA3OCAxMDA2NDQKPiA+
ID4gPiA+ID4gLS0tIGEvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gPiA+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvdmhvc3Qvdmhvc3QuYwo+ID4gPiA+ID4gPiBAQCAtMjk5LDYgKzI5OSw3IEBAIHN0YXRp
YyB2b2lkIHZob3N0X3ZxX3Jlc2V0KHN0cnVjdCB2aG9zdF9kZXYgKmRldiwKPiA+ID4gPiA+ID4g
ICAgIHsKPiA+ID4gPiA+ID4gICAgIAl2cS0+bnVtID0gMTsKPiA+ID4gPiA+ID4gICAgIAl2cS0+
bmRlc2NzID0gMDsKPiA+ID4gPiA+ID4gKwl2cS0+Zmlyc3RfZGVzYyA9IDA7Cj4gPiA+ID4gPiA+
ICAgICAJdnEtPmRlc2MgPSBOVUxMOwo+ID4gPiA+ID4gPiAgICAgCXZxLT5hdmFpbCA9IE5VTEw7
Cj4gPiA+ID4gPiA+ICAgICAJdnEtPnVzZWQgPSBOVUxMOwo+ID4gPiA+ID4gPiBAQCAtMzY3LDYg
KzM2OCwxMSBAQCBzdGF0aWMgaW50IHZob3N0X3dvcmtlcih2b2lkICpkYXRhKQo+ID4gPiA+ID4g
PiAgICAgCXJldHVybiAwOwo+ID4gPiA+ID4gPiAgICAgfQo+ID4gPiA+ID4gPiArc3RhdGljIGlu
dCB2aG9zdF92cV9udW1fYmF0Y2hfZGVzY3Moc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpCj4g
PiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiA+ICsJcmV0dXJuIHZxLT5tYXhfZGVzY3MgLSBVSU9fTUFY
SU9WOwo+ID4gPiA+ID4gPiArfQo+ID4gPiA+ID4gMSBkZXNjcmlwdG9yIGRvZXMgbm90IG1lYW4g
MSBpb3YsIGUuZyB1c2Vyc3BhY2UgbWF5IHBhc3Mgc2V2ZXJhbCAxIGJ5dGUKPiA+ID4gPiA+IGxl
bmd0aCBtZW1vcnkgcmVnaW9ucyBmb3IgdXMgdG8gdHJhbnNsYXRlLgo+ID4gPiA+ID4gCj4gPiA+
ID4gWWVzIGJ1dCBJIGRvbid0IHNlZSB0aGUgcmVsZXZhbmNlLiBUaGlzIHRlbGxzIHVzIGhvdyBt
YW55IGRlc2NyaXB0b3JzIHRvCj4gPiA+ID4gYmF0Y2gsIG5vdCBob3cgbWFueSBJT1ZzLgo+ID4g
PiBZZXMsIGJ1dCBxdWVzdGlvbnMgYXJlOgo+ID4gPiAKPiA+ID4gLSB0aGlzIGludHJvZHVjZSBh
bm90aGVyIG9ic3RhY2xlIHRvIHN1cHBvcnQgbW9yZSB0aGFuIDFLIHF1ZXVlIHNpemUKPiA+ID4g
LSBpZiB3ZSBzdXBwb3J0IDFLIHF1ZXVlIHNpemUsIGRvZXMgaXQgbWVhbiB3ZSBuZWVkIHRvIGNh
Y2hlIDFLIGRlc2NyaXB0b3JzLAo+ID4gPiB3aGljaCBzZWVtcyBhIGxhcmdlIHN0cmVzcyBvbiB0
aGUgY2FjaGUKPiA+ID4gCj4gPiA+IFRoYW5rcwo+ID4gPiAKPiA+ID4gCj4gPiBTdGlsbCBkb24n
dCB1bmRlcnN0YW5kIHRoZSByZWxldmFuY2UuIFdlIHN1cHBvcnQgdXAgdG8gMUsgZGVzY3JpcHRv
cnMKPiA+IHBlciBidWZmZXIganVzdCBmb3IgSU9WIHNpbmNlIHdlIGFsd2F5cyBkaWQuIFRoaXMg
YWRkcyA2NCBtb3JlCj4gPiBkZXNjcmlwdG9ycyAtIGlzIHRoYXQgYSBiaWcgZGVhbD8KPiAKPiAK
PiBJZiBJIHVuZGVyc3RhbmRpbmcgY29ycmVjdGx5LCBmb3IgbmV0LCB0aGUgY29kZSB0cmllcyB0
byBiYXRjaCBkZXNjcmlwdG9ycwo+IGZvciBhdCBsYXN0IG9uZSBwYWNrZXQuCj4gCj4gSWYgd2Ug
YWxsb3cgMUsgcXVldWUgc2l6ZSB0aGVuIHdlIGFsbG93IGEgcGFja2V0IHRoYXQgY29uc2lzdHMg
b2YgMUsKPiBkZXNjcmlwdG9ycy4gVGhlbiB3ZSBuZWVkIHRvIGNhY2hlIDFLIGRlc2NyaXB0b3Jz
Lgo+IAo+IFRoYW5rcwoKVGhhdCBjYXNlIGlzIGFscmVhZHkgc28gcGF0aG9sb2dpY2FsLCBJIGFt
IG5vdCBhdCBhbGwgd29ycmllZCBhYm91dAppdCBwZXJmb3JtaW5nIHdlbGwuCgotLSAKTVNUCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
