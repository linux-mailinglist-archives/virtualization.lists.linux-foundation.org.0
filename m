Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1334224D6
	for <lists.virtualization@lfdr.de>; Tue,  5 Oct 2021 13:18:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 240A4606BF;
	Tue,  5 Oct 2021 11:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcxUqf3GXkte; Tue,  5 Oct 2021 11:18:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E66DC60903;
	Tue,  5 Oct 2021 11:18:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7014CC000D;
	Tue,  5 Oct 2021 11:18:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4429DC000D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 11:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3332860903
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 11:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uoJJ51sO1oYk
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 11:18:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93496606BF
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 11:18:17 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195BBvJ5028865; 
 Tue, 5 Oct 2021 07:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=OyYWH4n+eBIhENYLYr5jBW2Hb+tHjob3ODXbs8wipp8=;
 b=SrrzCRe+5reJ0R/Dh8WhO9AN+drfMuU8H+45ns6xJh0f8AtWlJXFk8y0d1jiNkJgvpWv
 eJYmOR9XoMuB/AOZloy9kM8MCX3jQe2j5wGoawuha5BgTIP3mDmhfiQXJujiy63aUnXW
 v2k70N6Fx/GkLMHpwzCY8/sMXcZA7nh3jjmcy1oXGDPZgj2lPFCAEq0b2TIjxmoiGAT9
 d1GbEYlHt/b+bZpojdq1oSH4FH+o3AVrFi5JU0BnDGCuZeYWTqnqNrKaYI1Ci1XIxir1
 EoAR+oQvL3oe+bpiOXebycnKt9YIT7A5SToMgr4zPr8TPTYebXaJhluvpMQgDJtvT6tV oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgnm904s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 07:18:15 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 195BDNIR031914;
 Tue, 5 Oct 2021 07:18:15 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgnm904rb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 07:18:15 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 195BCbg7006291;
 Tue, 5 Oct 2021 11:18:13 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3bef29yb53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 11:18:13 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 195BCnR130998822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 11:12:49 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 247A1AE063;
 Tue,  5 Oct 2021 11:18:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07067AE045;
 Tue,  5 Oct 2021 11:18:08 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.45.119])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  5 Oct 2021 11:18:07 +0000 (GMT)
Date: Tue, 5 Oct 2021 13:17:51 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [virtio-dev] Re: [RFC PATCH 1/1] virtio: write back features
 before verify
Message-ID: <20211005131751.53175b10.pasic@linux.ibm.com>
In-Reply-To: <20211004160005-mutt-send-email-mst@kernel.org>
References: <87fstm47no.fsf@redhat.com>
 <20211002141351-mutt-send-email-mst@kernel.org>
 <20211003070030.658fc94e.pasic@linux.ibm.com>
 <20211003021027-mutt-send-email-mst@kernel.org>
 <20211003032253-mutt-send-email-mst@kernel.org>
 <87ee912e45.fsf@redhat.com>
 <20211004083455-mutt-send-email-mst@kernel.org>
 <878rz83lx0.fsf@redhat.com>
 <20211004110152-mutt-send-email-mst@kernel.org>
 <87zgro23r1.fsf@redhat.com>
 <20211004160005-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9gaiqSXmPn_x9AjMuITDUyXUKN9UZVPY
X-Proofpoint-ORIG-GUID: NtvF1X0oiMGcW3bFKnAES-ppYgqouYHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 clxscore=1011 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110050065
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Xie Yongji <xieyongji@bytedance.com>, virtio-dev@lists.oasis-open.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Mon, 4 Oct 2021 16:01:12 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> > 
> > Ok, so what about something like
> > 
> > "If FEATURES_OK is not set, the driver MAY change the set of features it
> > accepts."
> > 
> > in the device initialization section?  
> 
> Maybe "as long as". However Halil implied that some features are not
> turned off properly if that happens. Halil could you pls provide
> some examples?



static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
{
...
    if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
        qapi_event_send_failover_negotiated(n->netclient_name);
        qatomic_set(&n->failover_primary_hidden, false);
        failover_add_primary(n, &err);
        if (err) {
            warn_report_err(err);
        }
    }
}

This is probably the only one in QEMU. Back then I stopped looking
after the first hit.

Regards,
Halil
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
