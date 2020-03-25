Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D61192862
	for <lists.virtualization@lfdr.de>; Wed, 25 Mar 2020 13:30:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AF4B6882E7;
	Wed, 25 Mar 2020 12:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xh6WmeMJ-BYq; Wed, 25 Mar 2020 12:30:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 34C9588402;
	Wed, 25 Mar 2020 12:30:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D850C0177;
	Wed, 25 Mar 2020 12:30:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6890C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 12:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C355487FEA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 12:29:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4JVhIQPJJR08
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 12:29:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00057.outbound.protection.outlook.com [40.107.0.57])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CE05087FE8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 12:29:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkE1f86/zVDqiu/oxO3BoLImJjH1rmLUVmAZY2+u3RPa0B1qxJMOg2ZMcrrLKOvSNiiDXq0ZB0QY6W0H6nN+q762NB8/wHT+g4vNno9UJbu2ZiNVjJO7Ve/rmPa62k9QKQKRviWW6uaYrg5wAHqCCKRWypcPzM7NAPJvi5HuZxh0O7KMhaJrWUqRWDbhY5q6xFM9Grd6/mAIZZR19BrT7ySjEYm9Rdq9kO9AiC5q1AF1H6sWU/O5BTuEjRolTCvivOETRAVUqD2eJ7IjIwae1HYgSypDo1mk8dCrpxryzRo8UJHhOVFd7IQPa9R6ViZJMVv1vQ9qu5ASP/+UKmNdHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4t0K9EjkPeuZFuPUph0eo9tlaSIDwMFN6ti1U0DoQo=;
 b=IQJgbla4IEFFAgxPsPEZ0hH1oQ9gdexw2j3O8Nnq775B+aM4D4XhVg2gSp3Bk+u8bycq4RYYpwU4CInUAJStsd68awKYOBzm2kMvZLPgD8jDA61XkmZX+UqYDyITmglJhY9cTCB2ulQCDNCWpLDwrAAMZ8XBBhbM+8WRAxyolVbKiGiVsb1WElSbAQaSAhqKJLq0gRTJHW4Ax73V2D/sapZQCaF3uX3NJPFYWCtQRISQGP6I4rKZigmzYSPhbAfe40FeXNK0bn7mm8qHheNrMYwcryEH1nVbppViKRE4bc09fXDdDlEccvfFEEy5dUbHMn8Dn+FOboaqP2i0lntMvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4t0K9EjkPeuZFuPUph0eo9tlaSIDwMFN6ti1U0DoQo=;
 b=QCCnCkwtt56ISeKD+0h4dh4fvGQJPpw5Nba62lEmfQni2l0oHDiDA4EnazvMymsoYulnKIUPr3TFUfrrapGcRMT+DCybYfcevcYGobzte433BxAzNcmCmu8cW0rhqYJSXGxhe+WZEcVqN6YJIuiMlUgSyyqHiVufRjC6RGObGpw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6704.eurprd05.prod.outlook.com (10.141.128.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Wed, 25 Mar 2020 12:29:53 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3%7]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 12:29:53 +0000
Date: Wed, 25 Mar 2020 09:29:49 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V8 5/9] vDPA: introduce vDPA bus
Message-ID: <20200325122949.GW13183@mellanox.com>
References: <20200325082711.1107-1-jasowang@redhat.com>
 <20200325082711.1107-6-jasowang@redhat.com>
Content-Disposition: inline
In-Reply-To: <20200325082711.1107-6-jasowang@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:208:160::19) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR13CA0006.namprd13.prod.outlook.com (2603:10b6:208:160::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.9 via Frontend
 Transport; Wed, 25 Mar 2020 12:29:52 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jH5AL-0006F0-1U; Wed, 25 Mar 2020 09:29:49 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0d9fe0c7-eb7c-4b90-9069-08d7d0b837ff
X-MS-TrafficTypeDiagnostic: VI1PR05MB6704:|VI1PR05MB6704:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB6704C5FDBDAE585C27F89242CFCE0@VI1PR05MB6704.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0353563E2B
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(2616005)(36756003)(26005)(52116002)(81166006)(81156014)(8936002)(66946007)(66476007)(316002)(66556008)(8676002)(9786002)(4326008)(9746002)(478600001)(6916009)(186003)(5660300002)(33656002)(1076003)(4744005)(7416002)(2906002)(86362001)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6704;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9k9aO0yVB/ogXbrjmH55++nlJZl8TT2C9x/PladI+n6nYmnMuTNxhox6FSmRHXKlvtKITDu6rP7S9JFdESK2kjmPdLDjEKLegG9r+V47CPaH1KuwyFcG5hVuFSPVk4qWQ8DaOJEF7im/VRQCvfpeIJbdQS3TEcZtw1ec72hzlGBQL4gKQFKKHWppbVgQcNQ7AAGM5pZTwhRCFbcVYG9Tfn6yCNkt9JX+bwpA4zlcBLb8yvvMZ3RPrPuEvn+M9uli16b43lR4xhrWSU4uSSSktMStBRFFLWXbO74YDyONWS2b1bgzwymeEOJuOOPgQcmBq9iq3dYMnsv287sFFDo+91RZGcMwTxkoPBGEs7/Gmy5XzUI3a5vXtZ2uoI6NXlTVn3Yyh5b8OZ/WZ8pTp/l3m0+kmILKOyNxgzAFXtKFLCro0CIA1aQG0hbdzWMYtfUPuyCvMGQO2sfkJhu7INsAtXJG7UDCeTNdXQy32vjGAtp/73L9/iVmmugmjuH6yqEE
X-MS-Exchange-AntiSpam-MessageData: dWcCjkhYoMMP60CLaxaT0iYo+7g0pjrx9ySgB8t/NZ6fpbajg6y5iwAk5h19M2VcQOnxKNr5oYskxpFyexeLG7KAxAI+bvE7F6TayB2RT3dC/aNzSG2AxAWrJD53FdK5QLQQYFcpHtOmsNqLKitmkw==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9fe0c7-eb7c-4b90-9069-08d7d0b837ff
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2020 12:29:52.9779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOBACnTHppzZfKksoj68pP8+E/k3KI0xa3ateAEc0S96ursxjbHElBdBtsSX4fNC6YvwxY3ifrlTEuWI2iXnzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6704
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, shahafs@mellanox.com, parav@mellanox.com,
 vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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

On Wed, Mar 25, 2020 at 04:27:07PM +0800, Jason Wang wrote:
> +struct vdpa_device *__vdpa_alloc_device(struct device *parent,
> +					const struct vdpa_config_ops *config,
> +					size_t size);
> +
> +#define vdpa_alloc_device(dev_struct, member, parent, config)   \
> +			  container_of(__vdpa_alloc_device( \
> +				       parent, config, \
> +				       sizeof(struct dev_struct) + \
> +				       BUILD_BUG_ON_ZERO(offsetof( \
> +				       struct dev_struct, member))), \
> +				       struct dev_struct, member)

This all looks robust now, one minor remark is to not do 'struct
dev_struct' here so the caller has to do

   vdpa_alloc_device(struct foo, vpda, ...)

Which suggests to the reader something unusual is happening

Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
