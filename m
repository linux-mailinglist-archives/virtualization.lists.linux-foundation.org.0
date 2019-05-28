Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8C82CC71
	for <lists.virtualization@lfdr.de>; Tue, 28 May 2019 18:47:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 89CEA1C37;
	Tue, 28 May 2019 16:47:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9F44020DD
	for <virtualization@lists.linux-foundation.org>;
	Tue, 28 May 2019 16:45:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 17FB581A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 28 May 2019 16:45:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 7so3647413wmo.2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 28 May 2019 09:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=YfCDy8k/dL7Dko33LF05Qlo/QHsbXR3MAXNOFcVS/RA=;
	b=bBZBTSGQgDMeddCP99fRlOtkZpRPsceqNvPPkC6hjlliMxEXnwyXrJkY23s7mYXygw
	1u1Pmjrk2RnfEV9FwxfblWoKPL/w4FKb30zv70aLd0s3+SAmuJmgpvgbx+Ot1VfTn4/o
	SwIzJHxxUZijTQwWY6KSFy5FOF88HucF83WdooMIF5Rc2bC9PeKUAW+GoR7TFcEyE/g7
	dmNBlZ/mYFuNYPVzkEGnjzhvMJE3UeWSV44u68F22lE2oOYPY1W4U8U0IPFnhcJB0NPh
	/j3binZPknqj1jWKmnafW7YSE7gZ8xNDc0JLiNeyerFA8+Rb2iP1+ASMqYtKPMq4dwuH
	Y2iA==
X-Gm-Message-State: APjAAAXvdcVDgbPrs78S1ztmjEEfgxB8xfeY6YVY7jOz3UyEQZjtZCb1
	v0i4kvH6LYmbj2WWXljBE8XVdw==
X-Google-Smtp-Source: APXvYqxeKaGT5CziyQa01axCoTDbNIqIxP59JKIWEdNof8CFJIQ5zifxSdiU0fS+Hx4pML1S3A6kJg==
X-Received: by 2002:a1c:7d56:: with SMTP id y83mr3545448wmc.77.1559061925586; 
	Tue, 28 May 2019 09:45:25 -0700 (PDT)
Received: from steredhat.homenet.telecomitalia.it
	(host253-229-dynamic.248-95-r.retail.telecomitalia.it.
	[95.248.229.253])
	by smtp.gmail.com with ESMTPSA id x7sm1868809wmc.44.2019.05.28.09.45.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 09:45:24 -0700 (PDT)
Date: Tue, 28 May 2019 18:45:21 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 1/8] vsock/virtio: limit the memory used per-socket
Message-ID: <20190528164521.k2euedfcmtvvynew@steredhat.homenet.telecomitalia.it>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-2-sgarzare@redhat.com>
	<3b275b52-63d9-d260-1652-8e8bf7dd679f@redhat.com>
	<20190513172322.vcgenx7xk4v6r2ay@steredhat>
	<f834c9e9-5d0e-8ebb-44e0-6d99b6284e5c@redhat.com>
	<20190514163500.a7moalixvpn5mkcr@steredhat>
	<034a5081-b4fb-011f-b5b7-fbf293c13b23@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <034a5081-b4fb-011f-b5b7-fbf293c13b23@redhat.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	"David S. Miller" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTA6NDg6NDRBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzUvMTUg5LiK5Y2IMTI6MzUsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90
ZToKPiA+IE9uIFR1ZSwgTWF5IDE0LCAyMDE5IGF0IDExOjI1OjM0QU0gKzA4MDAsIEphc29uIFdh
bmcgd3JvdGU6Cj4gPiA+IE9uIDIwMTkvNS8xNCDkuIrljYgxOjIzLCBTdGVmYW5vIEdhcnphcmVs
bGEgd3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDU6NTg6NTNQTSArMDgw
MCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+IE9uIDIwMTkvNS8xMCDkuIvljYg4OjU4LCBT
dGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gPiA+ID4gPiA+ICtzdGF0aWMgc3RydWN0IHZpcnRp
b192c29ja19idWYgKgo+ID4gPiA+ID4gPiArdmlydGlvX3RyYW5zcG9ydF9hbGxvY19idWYoc3Ry
dWN0IHZpcnRpb192c29ja19wa3QgKnBrdCwgYm9vbCB6ZXJvX2NvcHkpCj4gPiA+ID4gPiA+ICt7
Cj4gPiA+ID4gPiA+ICsJc3RydWN0IHZpcnRpb192c29ja19idWYgKmJ1ZjsKPiA+ID4gPiA+ID4g
Kwo+ID4gPiA+ID4gPiArCWlmIChwa3QtPmxlbiA9PSAwKQo+ID4gPiA+ID4gPiArCQlyZXR1cm4g
TlVMTDsKPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArCWJ1ZiA9IGt6YWxsb2Moc2l6ZW9mKCpi
dWYpLCBHRlBfS0VSTkVMKTsKPiA+ID4gPiA+ID4gKwlpZiAoIWJ1ZikKPiA+ID4gPiA+ID4gKwkJ
cmV0dXJuIE5VTEw7Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gKwkvKiBJZiB0aGUgYnVmZmVy
IGluIHRoZSB2aXJ0aW9fdnNvY2tfcGt0IGlzIGZ1bGwsIHdlIGNhbiBtb3ZlIGl0IHRvCj4gPiA+
ID4gPiA+ICsJICogdGhlIG5ldyB2aXJ0aW9fdnNvY2tfYnVmIGF2b2lkaW5nIHRoZSBjb3B5LCBi
ZWNhdXNlIHdlIGFyZSBzdXJlIHRoYXQKPiA+ID4gPiA+ID4gKwkgKiB3ZSBhcmUgbm90IHVzZSBt
b3JlIG1lbW9yeSB0aGFuIHRoYXQgY291bnRlZCBieSB0aGUgY3JlZGl0IG1lY2hhbmlzbS4KPiA+
ID4gPiA+ID4gKwkgKi8KPiA+ID4gPiA+ID4gKwlpZiAoemVyb19jb3B5ICYmIHBrdC0+bGVuID09
IHBrdC0+YnVmX2xlbikgewo+ID4gPiA+ID4gPiArCQlidWYtPmFkZHIgPSBwa3QtPmJ1ZjsKPiA+
ID4gPiA+ID4gKwkJcGt0LT5idWYgPSBOVUxMOwo+ID4gPiA+ID4gPiArCX0gZWxzZSB7Cj4gPiA+
ID4gPiBJcyB0aGUgY29weSBzdGlsbCBuZWVkZWQgaWYgd2UncmUganVzdCBmZXcgYnl0ZXMgbGVz
cz8gV2UgbWVldCBzaW1pbGFyIGlzc3VlCj4gPiA+ID4gPiBmb3IgdmlyaXRvLW5ldCwgYW5kIHZp
cnRpby1uZXQgc29sdmUgdGhpcyBieSBhbHdheXMgY29weSBmaXJzdCAxMjhieXRlcyBmb3IKPiA+
ID4gPiA+IGJpZyBwYWNrZXRzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTZWUgcmVjZWl2ZV9iaWco
KQo+ID4gPiA+IEknbSBzZWVpbmcsIEl0IGlzIG1vcmUgc29waGlzdGljYXRlZC4KPiA+ID4gPiBJ
SVVDLCB2aXJ0aW8tbmV0IGFsbG9jYXRlcyBhIHNrX2J1ZmYgd2l0aCAxMjggYnl0ZXMgb2YgYnVm
ZmVyLCB0aGVuIGNvcGllcyB0aGUKPiA+ID4gPiBmaXJzdCAxMjggYnl0ZXMsIHRoZW4gYWRkcyB0
aGUgYnVmZmVyIHVzZWQgdG8gcmVjZWl2ZSB0aGUgcGFja2V0IGFzIGEgZnJhZyB0bwo+ID4gPiA+
IHRoZSBza2IuCj4gPiA+IAo+ID4gPiBZZXMgYW5kIHRoZSBwb2ludCBpcyBpZiB0aGUgcGFja2V0
IGlzIHNtYWxsZXIgdGhhbiAxMjggYnl0ZXMgdGhlIHBhZ2VzIHdpbGwKPiA+ID4gYmUgcmVjeWNs
ZWQuCj4gPiA+IAo+ID4gPiAKPiA+IFNvIGl0J3MgYXZvaWQgdGhlIG92ZXJoZWFkIG9mIGFsbG9j
YXRpb24gb2YgYSBsYXJnZSBidWZmZXIuIEkgZ290IGl0Lgo+ID4gCj4gPiBKdXN0IGEgY3VyaW9z
aXR5LCB3aHkgdGhlIHRocmVzaG9sZCBpcyAxMjggYnl0ZXM/Cj4gCj4gCj4gRnJvbSBpdHMgbmFt
ZSAoR09PRF9DT1BZX0xFTiksIEkgdGhpbmsgaXQganVzdCBhIHZhbHVlIHRoYXQgd29uJ3QgbG9z
ZSBtdWNoCj4gcGVyZm9ybWFuY2UsIGUuZyB0aGUgc2l6ZSB0d28gY2FjaGVsaW5lcy4KPiAKCkph
c29uLCBTdGVmYW4sCnNpbmNlIEknbSByZW1vdmluZyB0aGUgcGF0Y2hlcyB0byBpbmNyZWFzZSB0
aGUgYnVmZmVycyB0byA2NCBLaUIgYW5kIEknbQphZGRpbmcgYSB0aHJlc2hvbGQgZm9yIHNtYWxs
IHBhY2tldHMsIEkgd291bGQgc2ltcGxpZnkgdGhpcyBwYXRjaCwKcmVtb3ZpbmcgdGhlIG5ldyBi
dWZmZXIgYWxsb2NhdGlvbiBhbmQgY29weWluZyBzbWFsbCBwYWNrZXRzIGludG8gdGhlCmJ1ZmZl
cnMgYWxyZWFkeSBxdWV1ZWQgKGlmIHRoZXJlIGlzIGEgc3BhY2UpLgpJbiB0aGlzIHdheSwgSSBz
aG91bGQgc29sdmUgdGhlIGlzc3VlIG9mIDEgYnl0ZSBwYWNrZXRzLgoKRG8geW91IHRoaW5rIGNv
dWxkIGJlIGJldHRlcj8KClRoYW5rcywKU3RlZmFubwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
